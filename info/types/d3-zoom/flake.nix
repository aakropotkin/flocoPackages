{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/d3-zoom?_rev=689-4588684ff1f7fb86be6f5b53e9932fd7";
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
    ident = "@types/d3-zoom";
    ldir  = "info/types/d3-zoom";
    inherit packument fetchInfo;
  } // latest';

}
