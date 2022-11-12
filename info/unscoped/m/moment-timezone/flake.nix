{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/moment-timezone?_rev=170-12667dc01bc751ac1fb4401ed5ddc167";
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
    ident = "moment-timezone";
    ldir  = "info/unscoped/m/moment-timezone";
    inherit packument fetchInfo;
  } // latest';

}
