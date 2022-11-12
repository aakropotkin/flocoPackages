{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/npm-packlist?_rev=82-bcd13d37039e5badd9fc85877f4bf8ef";
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
    ident = "npm-packlist";
    ldir  = "info/unscoped/n/npm-packlist";
    inherit packument fetchInfo;
  } // latest';

}
