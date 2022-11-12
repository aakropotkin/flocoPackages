{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-set?_rev=11-462b50fd8cb25e5df7476f70098e6676";
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
    ident = "is-set";
    ldir  = "info/unscoped/i/is-set";
    inherit packument fetchInfo;
  } // latest';

}
