{

  inputs.packument.url   = "https://registry.npmjs.org/safe-buffer?rev=22-1ec582f50205e1d0fc4b7a155e4e560c";
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
    ident = "safe-buffer";
    ldir  = "info/unscoped/s/safe-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
