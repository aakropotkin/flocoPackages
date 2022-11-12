{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/trough?_rev=14-74b591f24262c2b89dd1bec1a073ee32";
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
    ident = "trough";
    ldir  = "info/unscoped/t/trough";
    inherit packument fetchInfo;
  } // latest';

}
