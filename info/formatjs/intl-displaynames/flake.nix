{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@formatjs%2fintl-displaynames?_rev=109-20e320646a30fd1281a3665fb1a9506f";
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
    scope = "@formatjs";
    ident = "@formatjs/intl-displaynames";
    ldir  = "info/formatjs/intl-displaynames";
    inherit packument fetchInfo;
  } // latest';

}
