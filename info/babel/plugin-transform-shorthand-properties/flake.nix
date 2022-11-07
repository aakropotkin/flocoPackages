{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-shorthand-properties?rev=78-4cfb5736cd3b2a7e256e2c7f93172f7a";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-shorthand-properties";
    ldir  = "info/babel/plugin-transform-shorthand-properties";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
