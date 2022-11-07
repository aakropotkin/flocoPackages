{

  inputs.packument.url   = "https://registry.npmjs.org/jest-watcher?rev=130-725f1da216b462168ced60ed85dbe0c3";
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
    ident = "jest-watcher";
    ldir  = "info/unscoped/j/jest-watcher";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
