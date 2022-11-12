{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-color-gray?_rev=21-b6a2a4dcb6a816eeecf9a6352fea61dc";
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
    ident = "postcss-color-gray";
    ldir  = "info/unscoped/p/postcss-color-gray";
    inherit packument fetchInfo;
  } // latest';

}
