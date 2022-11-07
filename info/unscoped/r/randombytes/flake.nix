{

  inputs.packument.url   = "https://registry.npmjs.org/randombytes?rev=28-50b81fe6f39eadd981ac48ea89d092a7";
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
    ident = "randombytes";
    ldir  = "info/unscoped/r/randombytes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
