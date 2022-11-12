{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-hierarchy?_rev=39-866891b123bcf538f4ef79fd08f5f7eb";
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
    ident = "d3-hierarchy";
    ldir  = "info/unscoped/d/d3-hierarchy";
    inherit packument fetchInfo;
  } // latest';

}
