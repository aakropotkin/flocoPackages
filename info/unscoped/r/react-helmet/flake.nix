{

  inputs.packument.url   = "https://registry.npmjs.org/react-helmet?rev=126-3c1e3ed98f57ad325b8f85c341fbba5b";
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
    ident = "react-helmet";
    ldir  = "info/unscoped/r/react-helmet";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
