{

  inputs.packument.url   = "https://registry.npmjs.org/is-shared-array-buffer";
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
    ident = "is-shared-array-buffer";
    ldir  = "info/unscoped/i/is-shared-array-buffer";
    inherit packument fetchInfo;
  } // latest';

}
