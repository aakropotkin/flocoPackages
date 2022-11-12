{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-smooth?_rev=57-085579e9b63d50c728f5a89e10b788f0";
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
    ident = "react-smooth";
    ldir  = "info/unscoped/r/react-smooth";
    inherit packument fetchInfo;
  } // latest';

}
