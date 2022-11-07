{

  inputs.packument.url   = "https://registry.npmjs.org/hash-for-dep?rev=33-6b86d172b2e93bb1a273caa17fec07c9";
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
    ident = "hash-for-dep";
    ldir  = "info/unscoped/h/hash-for-dep";
    inherit packument fetchInfo;
  } // latest';

}
