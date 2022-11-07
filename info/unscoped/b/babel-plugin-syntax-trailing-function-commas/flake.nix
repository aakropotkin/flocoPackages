{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-syntax-trailing-function-commas?rev=69-86de081dc3d4639c8e2818ab0c0380d4";
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
    ident = "babel-plugin-syntax-trailing-function-commas";
    ldir  = "info/unscoped/b/babel-plugin-syntax-trailing-function-commas";
    inherit packument fetchInfo;
  } // latest';

}
