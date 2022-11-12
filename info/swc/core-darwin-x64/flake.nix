{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc/core-darwin-x64?_rev=199-11a83c7f62037cde80efa8272007d901";
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
    scope = "@swc";
    ident = "@swc/core-darwin-x64";
    ldir  = "info/swc/core-darwin-x64";
    inherit packument fetchInfo;
  } // latest';

}
