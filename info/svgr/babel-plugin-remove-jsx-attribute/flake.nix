{

  inputs.packument.url   = "https://registry.npmjs.org/@svgr/babel-plugin-remove-jsx-attribute?rev=11-72ecde0efc9d5ad585da7e7884511254";
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
    scope = "@svgr";
    ident = "@svgr/babel-plugin-remove-jsx-attribute";
    ldir  = "info/svgr/babel-plugin-remove-jsx-attribute";
    inherit packument fetchInfo;
  } // latest';

}
