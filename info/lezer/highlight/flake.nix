{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@lezer/highlight?_rev=4-ba892ce41751252ae745989314a75b58";
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
    scope = "@lezer";
    ident = "@lezer/highlight";
    ldir  = "info/lezer/highlight";
    inherit packument fetchInfo;
  } // latest';

}
