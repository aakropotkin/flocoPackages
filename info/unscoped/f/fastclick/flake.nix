{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fastclick?_rev=110-ef605973f1c078a1b71ab67088a066cb";
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
    ident = "fastclick";
    ldir  = "info/unscoped/f/fastclick";
    inherit packument fetchInfo;
  } // latest';

}
