{

  inputs.packument.url   = "https://registry.npmjs.org/typical?rev=34-48bbde0814b2fecc1fe6aa01bf275341";
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
    ident = "typical";
    ldir  = "info/unscoped/t/typical";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
