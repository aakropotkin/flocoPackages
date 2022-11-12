{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gl-matrix?_rev=57-8d3f714ee5c3616f0a6654f19a5fcbe9";
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
    ident = "gl-matrix";
    ldir  = "info/unscoped/g/gl-matrix";
    inherit packument fetchInfo;
  } // latest';

}
