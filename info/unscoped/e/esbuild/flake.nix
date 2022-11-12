{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild?_rev=371-b5eb4ad180b1cf6cb4a9cc32f31d1397";
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
    ident = "esbuild";
    ldir  = "info/unscoped/e/esbuild";
    inherit packument fetchInfo;
  } // latest';

}
