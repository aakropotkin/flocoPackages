{

  inputs.packument.url   = "https://registry.npmjs.org/decompress-tar?rev=29-07ffbf2c93198fdfe4e82e1c3ae8e930";
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
    ident = "decompress-tar";
    ldir  = "info/unscoped/d/decompress-tar";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
