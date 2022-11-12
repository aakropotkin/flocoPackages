{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vinyl?_rev=114-8937b057121abf48beb4c5117f5047b1";
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
    ident = "vinyl";
    ldir  = "info/unscoped/v/vinyl";
    inherit packument fetchInfo;
  } // latest';

}
