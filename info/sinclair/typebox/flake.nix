{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@sinclair%2ftypebox?_rev=130-4d1ecb0b6809da5fbe3884ff850c4881";
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
    scope = "@sinclair";
    ident = "@sinclair/typebox";
    ldir  = "info/sinclair/typebox";
    inherit packument fetchInfo;
  } // latest';

}
