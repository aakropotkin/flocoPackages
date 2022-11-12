{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-color?_rev=126-640af5f0c7105d4c800ec698f6df9df0";
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
    ident = "cli-color";
    ldir  = "info/unscoped/c/cli-color";
    inherit packument fetchInfo;
  } // latest';

}
