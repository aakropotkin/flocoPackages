{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-path?_rev=569-14dbede1bcf777ccfa994802c8cca7a0";
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
    ident = "@types/d3-path";
    ldir  = "info/types/d3-path";
    inherit packument fetchInfo;
  } // latest';

}
