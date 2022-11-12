{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/normalize-package-data?_rev=133-ee8546102ee28b69bb3edd374f19de2b";
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
    ident = "normalize-package-data";
    ldir  = "info/unscoped/n/normalize-package-data";
    inherit packument fetchInfo;
  } // latest';

}
