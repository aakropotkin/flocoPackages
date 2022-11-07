{

  inputs.packument.url   = "https://registry.npmjs.org/ee-first?rev=24-f301685a1c4195d37a082eb6332c56a3";
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
    ident = "ee-first";
    ldir  = "info/unscoped/e/ee-first";
    inherit packument fetchInfo;
  } // latest';

}
