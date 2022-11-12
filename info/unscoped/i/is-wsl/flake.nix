{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-wsl?_rev=8-c5a5b6aaa5f767f01a3783884fa78552";
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
    ident = "is-wsl";
    ldir  = "info/unscoped/i/is-wsl";
    inherit packument fetchInfo;
  } // latest';

}
