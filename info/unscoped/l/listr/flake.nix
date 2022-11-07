{

  inputs.packument.url   = "https://registry.npmjs.org/listr?rev=64-a50b5f6d9ca31db07051bb78c8606133";
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
    ident = "listr";
    ldir  = "info/unscoped/l/listr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
