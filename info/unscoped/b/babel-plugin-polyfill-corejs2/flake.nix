{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-polyfill-corejs2?rev=29-7d3c817cf9d2a8eab8c97c10ac87db89";
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
    ident = "babel-plugin-polyfill-corejs2";
    ldir  = "info/unscoped/b/babel-plugin-polyfill-corejs2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
