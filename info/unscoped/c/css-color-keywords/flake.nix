{

  inputs.packument.url   = "https://registry.npmjs.org/css-color-keywords?rev=2-2813256eb74a429bf0e2a72f4d09f411";
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
    ident = "css-color-keywords";
    ldir  = "info/unscoped/c/css-color-keywords";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
