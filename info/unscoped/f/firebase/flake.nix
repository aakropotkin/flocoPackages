{

  inputs.packument.url   = "https://registry.npmjs.org/firebase?rev=3406-32a0f1e7fe9ab977843e5730a1f0354c";
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
    ident = "firebase";
    ldir  = "info/unscoped/f/firebase";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
