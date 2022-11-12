{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc/jest?_rev=27-8ffc55b5d7cab30b85f6fee179906008";
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
    ident = "@swc/jest";
    ldir  = "info/swc/jest";
    inherit packument fetchInfo;
  } // latest';

}
