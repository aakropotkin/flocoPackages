{

  inputs.packument.url   = "https://registry.npmjs.org/sqlstring?rev=27-078d8e4bbb7384430a2b4345b6ed2894";
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
    ident = "sqlstring";
    ldir  = "info/unscoped/s/sqlstring";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
