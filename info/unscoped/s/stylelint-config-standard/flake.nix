{

  inputs.packument.url   = "https://registry.npmjs.org/stylelint-config-standard?rev=63-fb77eb8171c7774d204c5dd7842721d1";
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
    ident = "stylelint-config-standard";
    ldir  = "info/unscoped/s/stylelint-config-standard";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
