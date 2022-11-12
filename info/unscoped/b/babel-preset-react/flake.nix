{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-preset-react?_rev=155-c1eac3c0800c95a6591c1c764d9ae6d9";
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
    ident = "babel-preset-react";
    ldir  = "info/unscoped/b/babel-preset-react";
    inherit packument fetchInfo;
  } // latest';

}
