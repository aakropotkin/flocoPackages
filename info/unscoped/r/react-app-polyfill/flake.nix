{

  inputs.packument.url   = "https://registry.npmjs.org/react-app-polyfill?rev=45-94a5e31b37a363286b12c1aad0c40ae2";
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
    ident = "react-app-polyfill";
    ldir  = "info/unscoped/r/react-app-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
