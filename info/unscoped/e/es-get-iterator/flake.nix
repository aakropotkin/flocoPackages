{

  inputs.packument.url   = "https://registry.npmjs.org/es-get-iterator?rev=6-3a1f2cf0bc2c453710e5be48319d3cf3";
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
    ident = "es-get-iterator";
    ldir  = "info/unscoped/e/es-get-iterator";
    inherit packument fetchInfo;
  } // latest';

}
