{

  inputs.packument.url   = "https://registry.npmjs.org/sparse-bitfield?rev=12-6723ed446c6eb73e50ebadd26e330d29";
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
    ident = "sparse-bitfield";
    ldir  = "info/unscoped/s/sparse-bitfield";
    inherit packument fetchInfo;
  } // latest';

}
