{

  inputs.packument.url   = "https://registry.npmjs.org/react-hot-loader?rev=321-85dbd179f551b55cd69538f3cf5a5dfc";
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
    ident = "react-hot-loader";
    ldir  = "info/unscoped/r/react-hot-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
