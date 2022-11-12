{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-safe-parser?_rev=25-74f1efbd17513ebad88a539899a7f978";
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
    ident = "postcss-safe-parser";
    ldir  = "info/unscoped/p/postcss-safe-parser";
    inherit packument fetchInfo;
  } // latest';

}
