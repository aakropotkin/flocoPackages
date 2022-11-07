{

  inputs.packument.url   = "https://registry.npmjs.org/y18n?rev=37-9e422faa8b8e8bd0e2dccf5d2735d3a8";
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
    ident = "y18n";
    ldir  = "info/unscoped/y/y18n";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
