{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/inflation?_rev=11-79a44460eef60cc44863c471c0615120";
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
    ident = "inflation";
    ldir  = "info/unscoped/i/inflation";
    inherit packument fetchInfo;
  } // latest';

}
