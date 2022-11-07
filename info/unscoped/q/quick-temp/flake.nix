{

  inputs.packument.url   = "https://registry.npmjs.org/quick-temp?rev=20-6e28842e578e4e3f73f89ea9955370c2";
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
    ident = "quick-temp";
    ldir  = "info/unscoped/q/quick-temp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
