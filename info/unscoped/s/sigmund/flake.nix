{

  inputs.packument.url   = "https://registry.npmjs.org/sigmund?rev=18-ce431ff36b57a3fc61bb927d7860c903";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "sigmund";
    ldir  = "info/unscoped/s/sigmund";
    inherit packument fetchInfo;
  } // latest';

}
