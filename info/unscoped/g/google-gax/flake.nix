{

  inputs.packument.url   = "https://registry.npmjs.org/google-gax?rev=347-62e5a757a503bfa78ecd6ffc30e479f3";
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
    ident = "google-gax";
    ldir  = "info/unscoped/g/google-gax";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
