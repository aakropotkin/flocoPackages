{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-format?_rev=57-de3fadd55997d18ca426ac24e2d0a3c8";
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
    ident = "d3-format";
    ldir  = "info/unscoped/d/d3-format";
    inherit packument fetchInfo;
  } // latest';

}
