{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-align?_rev=52-4c3b266aae90fec8d479f943bafe7106";
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
    ident = "rc-align";
    ldir  = "info/unscoped/r/rc-align";
    inherit packument fetchInfo;
  } // latest';

}
