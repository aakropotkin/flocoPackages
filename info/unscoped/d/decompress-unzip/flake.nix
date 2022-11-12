{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/decompress-unzip?_rev=38-c3f3840c9650af870e3c85e5e2a69538";
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
    ident = "decompress-unzip";
    ldir  = "info/unscoped/d/decompress-unzip";
    inherit packument fetchInfo;
  } // latest';

}
