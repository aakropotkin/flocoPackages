{

  inputs.packument.url   = "https://registry.npmjs.org/npm-install-checks?rev=54-9cb04ea5881a66e1214b512c09808ee9";
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
    ident = "npm-install-checks";
    ldir  = "info/unscoped/n/npm-install-checks";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
