{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-normalize-charset?rev=41-8e15e0b1618be64c1b11036d8962a74f";
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
    ident = "postcss-normalize-charset";
    ldir  = "info/unscoped/p/postcss-normalize-charset";
    inherit packument fetchInfo;
  } // latest';

}
