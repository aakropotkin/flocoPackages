{

  inputs.packument.url   = "https://registry.npmjs.org/walk-up-path?rev=1-68a6378846e1222355f9c528a56d3994";
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
    ident = "walk-up-path";
    ldir  = "info/unscoped/w/walk-up-path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
