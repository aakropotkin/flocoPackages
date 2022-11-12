{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/decompress-targz?_rev=33-afecf01706e50d3d5f8be37a9b034fd4";
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
    ident = "decompress-targz";
    ldir  = "info/unscoped/d/decompress-targz";
    inherit packument fetchInfo;
  } // latest';

}
