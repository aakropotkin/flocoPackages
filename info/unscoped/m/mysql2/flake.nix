{

  inputs.packument.url   = "https://registry.npmjs.org/mysql2?rev=281-1d107bba689df15410e501e99d468393";
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
    ident = "mysql2";
    ldir  = "info/unscoped/m/mysql2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
