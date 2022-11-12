{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/length-sort?_rev=7-c53c3feea382c4565f488e52ddb7a624";
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
    ident = "length-sort";
    ldir  = "info/unscoped/l/length-sort";
    inherit packument fetchInfo;
  } // latest';

}
