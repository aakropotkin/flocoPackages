{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@sqltools%2fformatter?_rev=16-ff24010f500a3d3ec1a68cc7822aef35";
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
    scope = "@sqltools";
    ident = "@sqltools/formatter";
    ldir  = "info/sqltools/formatter";
    inherit packument fetchInfo;
  } // latest';

}
