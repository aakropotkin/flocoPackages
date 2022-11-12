{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-normalize?_rev=29-7152f4123cd1c535193965066e28d8ab";
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
    ident = "postcss-normalize";
    ldir  = "info/unscoped/p/postcss-normalize";
    inherit packument fetchInfo;
  } // latest';

}
