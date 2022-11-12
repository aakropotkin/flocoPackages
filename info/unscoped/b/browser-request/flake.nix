{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browser-request?_rev=44-cf654b9fc3d03e95318eb70dbe6526b1";
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
    ident = "browser-request";
    ldir  = "info/unscoped/b/browser-request";
    inherit packument fetchInfo;
  } // latest';

}
