{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@google-cloud/paginator?_rev=30-42e4185c57c3ca7918c59c73ff3acebe";
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
    scope = "@google-cloud";
    ident = "@google-cloud/paginator";
    ldir  = "info/google-cloud/paginator";
    inherit packument fetchInfo;
  } // latest';

}
