{

  inputs.packument.url   = "https://registry.npmjs.org/ci-info?rev=29-40f2b4f3ab2761fb39c1f6221157f05a";
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
    ident = "ci-info";
    ldir  = "info/unscoped/c/ci-info";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
