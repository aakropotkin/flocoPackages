{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@isaacs%2fstring-locale-compare?_rev=4-e463d762a9436ecc806971f320cfec92";
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
    scope = "@isaacs";
    ident = "@isaacs/string-locale-compare";
    ldir  = "info/isaacs/string-locale-compare";
    inherit packument fetchInfo;
  } // latest';

}
