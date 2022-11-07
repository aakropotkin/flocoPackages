{

  inputs.packument.url   = "https://registry.npmjs.org/crc?rev=58-be522e005f771a3da89013c1b3c1860b";
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
    ident = "crc";
    ldir  = "info/unscoped/c/crc";
    inherit packument fetchInfo;
  } // latest';

}
