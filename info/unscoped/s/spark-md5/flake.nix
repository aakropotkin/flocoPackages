{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/spark-md5?_rev=23-a92c081fe9d56def9daef6d284d99e81";
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
    ident = "spark-md5";
    ldir  = "info/unscoped/s/spark-md5";
    inherit packument fetchInfo;
  } // latest';

}
