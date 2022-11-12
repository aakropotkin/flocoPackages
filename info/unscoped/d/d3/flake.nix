{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3?_rev=558-9e0d18e6b4371f8bc63f13e0b91b6a25";
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
    ident = "d3";
    ldir  = "info/unscoped/d/d3";
    inherit packument fetchInfo;
  } // latest';

}
