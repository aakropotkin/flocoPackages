{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@techteamer%2focsp?_rev=2-118fe4cf14a0ccdd509b49bd95ee15ac";
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
    scope = "@techteamer";
    ident = "@techteamer/ocsp";
    ldir  = "info/techteamer/ocsp";
    inherit packument fetchInfo;
  } // latest';

}
