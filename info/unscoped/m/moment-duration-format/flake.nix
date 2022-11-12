{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/moment-duration-format?_rev=38-1dc3b6b905bb121328cae0bae34c0ec3";
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
    ident = "moment-duration-format";
    ldir  = "info/unscoped/m/moment-duration-format";
    inherit packument fetchInfo;
  } // latest';

}
