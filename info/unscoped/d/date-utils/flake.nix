{

  inputs.packument.url   = "https://registry.npmjs.org/date-utils?rev=92-3913fe02b1f726d4fef1285123d6a5b2";
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
    ident = "date-utils";
    ldir  = "info/unscoped/d/date-utils";
    inherit packument fetchInfo;
  } // latest';

}
