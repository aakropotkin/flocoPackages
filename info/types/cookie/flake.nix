{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fcookie?_rev=629-45eba8b9d76b6b51f96aad1a7cd24f91";
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
    ident = "@types/cookie";
    ldir  = "info/types/cookie";
    inherit packument fetchInfo;
  } // latest';

}
