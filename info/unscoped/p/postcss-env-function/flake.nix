{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-env-function?rev=13-ad43b5eeac8e11b510f778a794155a0e";
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
    ident = "postcss-env-function";
    ldir  = "info/unscoped/p/postcss-env-function";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
