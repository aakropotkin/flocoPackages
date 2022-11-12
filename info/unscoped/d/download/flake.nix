{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/download?_rev=293-12c5a49b8f8cb40ddf6112ad75b8d98a";
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
    ident = "download";
    ldir  = "info/unscoped/d/download";
    inherit packument fetchInfo;
  } // latest';

}
