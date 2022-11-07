{

  inputs.packument.url   = "https://registry.npmjs.org/@types/jasmine?rev=1446-47253ce1790431d0a4b22f696e4d2ab2";
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
    scope = "@types";
    ident = "@types/jasmine";
    ldir  = "info/types/jasmine";
    inherit packument fetchInfo;
  } // latest';

}
