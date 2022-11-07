{

  inputs.packument.url   = "https://registry.npmjs.org/cosmiconfig?rev=62-517489e6b5403e8d333e3275bdf96ad0";
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
    ident = "cosmiconfig";
    ldir  = "info/unscoped/c/cosmiconfig";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
