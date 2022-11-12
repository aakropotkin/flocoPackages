{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/culvert?_rev=8-d9619784092bb79ee772bb5476864149";
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
    ident = "culvert";
    ldir  = "info/unscoped/c/culvert";
    inherit packument fetchInfo;
  } // latest';

}
