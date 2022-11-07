{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-scope?rev=39-c0e4e8c5bbb875c535132f8a5f9ff99c";
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
    ident = "eslint-scope";
    ldir  = "info/unscoped/e/eslint-scope";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
