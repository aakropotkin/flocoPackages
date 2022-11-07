{

  inputs.packument.url   = "https://registry.npmjs.org/xdg-basedir?rev=20-57104d5f5e72deaad92c872f7bc44094";
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
    ident = "xdg-basedir";
    ldir  = "info/unscoped/x/xdg-basedir";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
