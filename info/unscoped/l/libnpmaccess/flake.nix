{

  inputs.packument.url   = "https://registry.npmjs.org/libnpmaccess?rev=51-9be02af74676c9ba784e206e07f266c2";
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
    ident = "libnpmaccess";
    ldir  = "info/unscoped/l/libnpmaccess";
    inherit packument fetchInfo;
  } // latest';

}
