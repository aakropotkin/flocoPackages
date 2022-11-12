{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bizcharts?_rev=259-2644d98fc690d9a6b68ed46915bdadcd";
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
    ident = "bizcharts";
    ldir  = "info/unscoped/b/bizcharts";
    inherit packument fetchInfo;
  } // latest';

}
