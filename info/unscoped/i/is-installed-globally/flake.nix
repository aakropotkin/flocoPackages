{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-installed-globally?_rev=8-4ced90ce2add9c5477b1ad1d0e9c6761";
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
    ident = "is-installed-globally";
    ldir  = "info/unscoped/i/is-installed-globally";
    inherit packument fetchInfo;
  } // latest';

}
