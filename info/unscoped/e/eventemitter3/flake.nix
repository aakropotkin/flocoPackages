{

  inputs.packument.url   = "https://registry.npmjs.org/eventemitter3?rev=94-3ca4a6c28d0d87b74677fff7138a5dee";
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
    ident = "eventemitter3";
    ldir  = "info/unscoped/e/eventemitter3";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
