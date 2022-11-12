{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-transition?_rev=57-412df63bf104282a75843bf035d17248";
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
    ident = "d3-transition";
    ldir  = "info/unscoped/d/d3-transition";
    inherit packument fetchInfo;
  } // latest';

}
