{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/temp-dir?_rev=5-6fae4e12ddf3dd61c8dab04c8eaf29ac";
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
    ident = "temp-dir";
    ldir  = "info/unscoped/t/temp-dir";
    inherit packument fetchInfo;
  } // latest';

}
