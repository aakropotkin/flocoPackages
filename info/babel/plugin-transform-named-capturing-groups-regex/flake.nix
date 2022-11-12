{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-named-capturing-groups-regex?_rev=35-fe862ed107710932fd2cd38ddcac89ce";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-named-capturing-groups-regex";
    ldir  = "info/babel/plugin-transform-named-capturing-groups-regex";
    inherit packument fetchInfo;
  } // latest';

}
