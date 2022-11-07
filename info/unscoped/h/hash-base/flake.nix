{

  inputs.packument.url   = "https://registry.npmjs.org/hash-base?rev=18-92b30d4891a33eabdfc4d7bc5f54971f";
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
    ident = "hash-base";
    ldir  = "info/unscoped/h/hash-base";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
