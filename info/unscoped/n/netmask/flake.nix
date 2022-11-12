{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/netmask?_rev=29-309a2e9089f9d0705c114fa04f08e3e2";
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
    ident = "netmask";
    ldir  = "info/unscoped/n/netmask";
    inherit packument fetchInfo;
  } // latest';

}
