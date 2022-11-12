{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-page-break?_rev=8-4894b14bd93625b54fc7517c1395e7a1";
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
    ident = "postcss-page-break";
    ldir  = "info/unscoped/p/postcss-page-break";
    inherit packument fetchInfo;
  } // latest';

}
