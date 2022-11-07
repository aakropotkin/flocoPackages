{

  inputs.packument.url   = "https://registry.npmjs.org/@pm2/pm2-version-check?rev=5-8a6fa0e0e7249ef395b5d765fc4d9791";
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
    scope = "@pm2";
    ident = "@pm2/pm2-version-check";
    ldir  = "info/pm2/pm2-version-check";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
