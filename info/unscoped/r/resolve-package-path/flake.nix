{

  inputs.packument.url   = "https://registry.npmjs.org/resolve-package-path?rev=30-9610ddb9006a4a7b2f5eeea349a6fd81";
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
    ident = "resolve-package-path";
    ldir  = "info/unscoped/r/resolve-package-path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
