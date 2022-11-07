{

  inputs.packument.url   = "https://registry.npmjs.org/is-binary-path?rev=14-afcf90381403705bb5b816c77c6fe234";
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
    ident = "is-binary-path";
    ldir  = "info/unscoped/i/is-binary-path";
    inherit packument fetchInfo;
  } // latest';

}
