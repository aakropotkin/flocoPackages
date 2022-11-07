{

  inputs.packument.url   = "https://registry.npmjs.org/is-function?rev=15-9204d3409d34fd1b5d8d12be921fe6fd";
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
    ident = "is-function";
    ldir  = "info/unscoped/i/is-function";
    inherit packument fetchInfo;
  } // latest';

}
