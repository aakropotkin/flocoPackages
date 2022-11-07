{

  inputs.packument.url   = "https://registry.npmjs.org/require-package-name?rev=5-481f7a3726f0ca27d79d2d128d120734";
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
    ident = "require-package-name";
    ldir  = "info/unscoped/r/require-package-name";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
