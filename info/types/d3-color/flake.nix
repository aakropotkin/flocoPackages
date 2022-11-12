{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-color?_rev=669-fb54ee1ac8c377a0650e50eb574465ff";
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
    ident = "@types/d3-color";
    ldir  = "info/types/d3-color";
    inherit packument fetchInfo;
  } // latest';

}
