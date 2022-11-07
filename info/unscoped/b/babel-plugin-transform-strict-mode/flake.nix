{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-strict-mode?rev=85-e3cc05a0aefd69cd7a0ced73853370e3";
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
    ident = "babel-plugin-transform-strict-mode";
    ldir  = "info/unscoped/b/babel-plugin-transform-strict-mode";
    inherit packument fetchInfo;
  } // latest';

}
