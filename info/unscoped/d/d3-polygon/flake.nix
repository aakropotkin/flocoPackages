{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-polygon?_rev=24-883280bc3e9ad2bba500444410261210";
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
    ident = "d3-polygon";
    ldir  = "info/unscoped/d/d3-polygon";
    inherit packument fetchInfo;
  } // latest';

}
