{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/validate-npm-package-name?_rev=59-09fb81de19d7cf081c5cad26ed5ff488";
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
    ident = "validate-npm-package-name";
    ldir  = "info/unscoped/v/validate-npm-package-name";
    inherit packument fetchInfo;
  } // latest';

}
