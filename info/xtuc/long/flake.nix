{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@xtuc/long?_rev=5-d47850e6218543093399074bc0e2f35f";
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
    scope = "@xtuc";
    ident = "@xtuc/long";
    ldir  = "info/xtuc/long";
    inherit packument fetchInfo;
  } // latest';

}
