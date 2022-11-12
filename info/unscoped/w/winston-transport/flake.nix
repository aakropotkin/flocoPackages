{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/winston-transport?_rev=28-e8cc75bbdef5653b2120e5e56e6bcdf1";
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
    ident = "winston-transport";
    ldir  = "info/unscoped/w/winston-transport";
    inherit packument fetchInfo;
  } // latest';

}
