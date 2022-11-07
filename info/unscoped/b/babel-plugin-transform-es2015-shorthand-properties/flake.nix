{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-shorthand-properties?rev=67-d2ad92122551468a07b84fdd48e47fdc";
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
    ident = "babel-plugin-transform-es2015-shorthand-properties";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-shorthand-properties";
    inherit packument fetchInfo;
  } // latest';

}
