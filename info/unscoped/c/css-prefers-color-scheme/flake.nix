{

  inputs.packument.url   = "https://registry.npmjs.org/css-prefers-color-scheme";
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
    ident = "css-prefers-color-scheme";
    ldir  = "info/unscoped/c/css-prefers-color-scheme";
    inherit packument fetchInfo;
  } // latest';

}
