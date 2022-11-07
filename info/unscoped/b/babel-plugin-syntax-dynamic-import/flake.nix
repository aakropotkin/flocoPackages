{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-syntax-dynamic-import?rev=68-629bd82df77ba19e3a4bf9ea943afc47";
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
    ident = "babel-plugin-syntax-dynamic-import";
    ldir  = "info/unscoped/b/babel-plugin-syntax-dynamic-import";
    inherit packument fetchInfo;
  } // latest';

}
