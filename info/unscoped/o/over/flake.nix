{

  inputs.packument.url   = "https://registry.npmjs.org/over?rev=17-54fa84debd3b2dc4854003dcdb431099";
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
    ident = "over";
    ldir  = "info/unscoped/o/over";
    inherit packument fetchInfo;
  } // latest';

}
