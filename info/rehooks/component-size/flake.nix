{

  inputs.packument.url   = "https://registry.npmjs.org/@rehooks/component-size?rev=5-853ff719fb4217dd5e5a55c46cd62b45";
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
    scope = "@rehooks";
    ident = "@rehooks/component-size";
    ldir  = "info/rehooks/component-size";
    inherit packument fetchInfo;
  } // latest';

}
