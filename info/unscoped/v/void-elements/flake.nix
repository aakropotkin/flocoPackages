{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/void-elements?_rev=26-0f93a406b950a2f70b85d5fd96d76c86";
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
    ident = "void-elements";
    ldir  = "info/unscoped/v/void-elements";
    inherit packument fetchInfo;
  } // latest';

}
