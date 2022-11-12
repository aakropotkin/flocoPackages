{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools%2fpostcss-ic-unit?_rev=2-5e9b7014439841bf03889748d60fbb46";
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
    ident = "@csstools/postcss-ic-unit";
    ldir  = "info/csstools/postcss-ic-unit";
    inherit packument fetchInfo;
  } // latest';

}
