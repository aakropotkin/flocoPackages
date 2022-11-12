{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vinyl-source-stream?_rev=121-675b5e6d3c444c38f449b91d6a3c9508";
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
    ident = "vinyl-source-stream";
    ldir  = "info/unscoped/v/vinyl-source-stream";
    inherit packument fetchInfo;
  } // latest';

}
