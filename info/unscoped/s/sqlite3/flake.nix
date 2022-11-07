{

  inputs.packument.url   = "https://registry.npmjs.org/sqlite3?rev=327-dba15df13201c0c34e5b5cda0905d411";
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
    ident = "sqlite3";
    ldir  = "info/unscoped/s/sqlite3";
    inherit packument fetchInfo;
  } // latest';

}
