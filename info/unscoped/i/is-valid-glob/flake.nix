{

  inputs.packument.url   = "https://registry.npmjs.org/is-valid-glob?rev=15-cabf9e08e24fd6d4a9db21b22a31ee51";
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
    ident = "is-valid-glob";
    ldir  = "info/unscoped/i/is-valid-glob";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
