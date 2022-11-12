{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/bytebuffer?_rev=689-cdc731c859e19f77ac28439897aa4fbe";
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
    ident = "@types/bytebuffer";
    ldir  = "info/types/bytebuffer";
    inherit packument fetchInfo;
  } // latest';

}
