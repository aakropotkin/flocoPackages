{

  inputs.packument.url   = "https://registry.npmjs.org/terser-webpack-plugin?rev=76-830409008befabcafdff5dfeb62a4739";
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
    ident = "terser-webpack-plugin";
    ldir  = "info/unscoped/t/terser-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
