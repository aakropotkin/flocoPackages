{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/abbrev?_rev=85-70021368fb73e7c0d291b3af4c220430";
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
    ident = "abbrev";
    ldir  = "info/unscoped/a/abbrev";
    inherit packument fetchInfo;
  } // latest';

}
