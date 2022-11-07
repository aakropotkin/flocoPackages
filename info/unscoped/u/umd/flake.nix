{

  inputs.packument.url   = "https://registry.npmjs.org/umd?rev=37-d9f3e3d662decd65e880fc82d8f6d706";
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
    ident = "umd";
    ldir  = "info/unscoped/u/umd";
    inherit packument fetchInfo;
  } // latest';

}
