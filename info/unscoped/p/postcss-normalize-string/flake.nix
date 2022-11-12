{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-normalize-string?_rev=38-a0fdc8eb0681c2cde4b37315484cc3ba";
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
    ident = "postcss-normalize-string";
    ldir  = "info/unscoped/p/postcss-normalize-string";
    inherit packument fetchInfo;
  } // latest';

}
