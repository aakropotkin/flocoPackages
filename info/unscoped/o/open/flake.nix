{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/open?_rev=153-6c80f12e5bde5cf364b73503402c4d95";
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
    ident = "open";
    ldir  = "info/unscoped/o/open";
    inherit packument fetchInfo;
  } // latest';

}
