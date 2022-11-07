{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-font-family-system-ui?rev=24-3de5e3ce2e70855b0edb339e1f0f23dd";
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
    ident = "postcss-font-family-system-ui";
    ldir  = "info/unscoped/p/postcss-font-family-system-ui";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
