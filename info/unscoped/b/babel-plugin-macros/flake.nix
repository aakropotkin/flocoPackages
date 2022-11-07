{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-macros?rev=49-731ca72265f5f237c472486f542211e0";
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
    ident = "babel-plugin-macros";
    ldir  = "info/unscoped/b/babel-plugin-macros";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
