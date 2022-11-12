{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tslint-config-prettier?_rev=26-94a56b5a911ca9308ea98257f3626578";
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
    ident = "tslint-config-prettier";
    ldir  = "info/unscoped/t/tslint-config-prettier";
    inherit packument fetchInfo;
  } // latest';

}
