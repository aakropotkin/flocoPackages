{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/undefsafe?_rev=19-beb54c4ca1060dcf0ad8c24b5af1cb44";
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
    ident = "undefsafe";
    ldir  = "info/unscoped/u/undefsafe";
    inherit packument fetchInfo;
  } // latest';

}
