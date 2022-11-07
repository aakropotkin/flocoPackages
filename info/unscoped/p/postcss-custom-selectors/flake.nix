{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-custom-selectors?rev=31-54b78feae3436d0b64dffe76d83c1d11";
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
    ident = "postcss-custom-selectors";
    ldir  = "info/unscoped/p/postcss-custom-selectors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
