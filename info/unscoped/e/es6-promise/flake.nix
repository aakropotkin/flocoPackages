{

  inputs.packument.url   = "https://registry.npmjs.org/es6-promise?rev=149-794fb8b4be5bea30d1bf3228792100d0";
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
    ident = "es6-promise";
    ldir  = "info/unscoped/e/es6-promise";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
