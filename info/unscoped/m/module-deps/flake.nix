{

  inputs.packument.url   = "https://registry.npmjs.org/module-deps?rev=306-bb50cdc1a46f3fc9c84f2a0c90f0ff8a";
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
    ident = "module-deps";
    ldir  = "info/unscoped/m/module-deps";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
