{

  inputs.packument.url   = "https://registry.npmjs.org/safe-regex2?rev=2-90ea04429ee4b19fb6d9c9494e76a461";
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
    ident = "safe-regex2";
    ldir  = "info/unscoped/s/safe-regex2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
