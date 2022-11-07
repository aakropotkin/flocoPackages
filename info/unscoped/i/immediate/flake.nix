{

  inputs.packument.url   = "https://registry.npmjs.org/immediate?rev=63-c06f114451f1137c2af9940bdcb3a407";
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
    ident = "immediate";
    ldir  = "info/unscoped/i/immediate";
    inherit packument fetchInfo;
  } // latest';

}
