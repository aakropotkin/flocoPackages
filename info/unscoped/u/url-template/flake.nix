{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/url-template?_rev=33-dfc66e4dd33691dce09b3edd40b4d351";
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
    ident = "url-template";
    ldir  = "info/unscoped/u/url-template";
    inherit packument fetchInfo;
  } // latest';

}
