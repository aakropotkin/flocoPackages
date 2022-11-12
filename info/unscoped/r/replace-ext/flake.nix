{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/replace-ext?_rev=28-c6f0b8ea9bd031079ef8d17477f8ebed";
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
    ident = "replace-ext";
    ldir  = "info/unscoped/r/replace-ext";
    inherit packument fetchInfo;
  } // latest';

}
