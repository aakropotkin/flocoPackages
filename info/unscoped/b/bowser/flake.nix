{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bowser?_rev=136-67ae2afcaf76fe09205ef53fa5c84143";
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
    ident = "bowser";
    ldir  = "info/unscoped/b/bowser";
    inherit packument fetchInfo;
  } // latest';

}
