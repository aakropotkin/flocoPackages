{

  inputs.packument.url   = "https://registry.npmjs.org/p-queue?rev=45-8684e0f81a1b1ced2c4ef11262c505b5";
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
    ident = "p-queue";
    ldir  = "info/unscoped/p/p-queue";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
