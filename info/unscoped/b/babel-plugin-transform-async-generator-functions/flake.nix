{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-async-generator-functions?rev=69-f9bc212d00dc9a5614afbf837562f40d";
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
    ident = "babel-plugin-transform-async-generator-functions";
    ldir  = "info/unscoped/b/babel-plugin-transform-async-generator-functions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
