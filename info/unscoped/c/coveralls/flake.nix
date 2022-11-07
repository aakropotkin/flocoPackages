{

  inputs.packument.url   = "https://registry.npmjs.org/coveralls?rev=149-a03ae9f1d1e24b07555439970a661f53";
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
    ident = "coveralls";
    ldir  = "info/unscoped/c/coveralls";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
