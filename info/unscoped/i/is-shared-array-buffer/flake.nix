{

  inputs.packument.url   = "https://registry.npmjs.org/is-shared-array-buffer?rev=3-3c78642e9a05c713bf34b577fb3e8f40";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
