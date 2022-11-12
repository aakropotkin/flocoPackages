{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/chart.js?_rev=171-6701c06196cf10967f9444e3eb9fd46a";
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
    ident = "chart.js";
    ldir  = "info/unscoped/c/chart.js";
    inherit packument fetchInfo;
  } // latest';

}
