{

  inputs.packument.url   = "https://registry.npmjs.org/@svgr/babel-plugin-replace-jsx-attribute-value?rev=10-f053f6eeb041d76cba5a73f3d153974b";
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
    ident = "@svgr/babel-plugin-replace-jsx-attribute-value";
    ldir  = "info/svgr/babel-plugin-replace-jsx-attribute-value";
    inherit packument fetchInfo;
  } // latest';

}
