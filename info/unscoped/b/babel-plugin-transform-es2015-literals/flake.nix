{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-literals?rev=65-69ab8f3c5ba9779d0df4dfaddb0d5b09";
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
    ident = "babel-plugin-transform-es2015-literals";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-literals";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
