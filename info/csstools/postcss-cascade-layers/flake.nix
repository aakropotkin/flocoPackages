{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools%2fpostcss-cascade-layers?_rev=8-f9ef5edf0b7571e3a5085d913c527f73";
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
    scope = "@csstools";
    ident = "@csstools/postcss-cascade-layers";
    ldir  = "info/csstools/postcss-cascade-layers";
    inherit packument fetchInfo;
  } // latest';

}
