{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/one-time?_rev=19-3b1483513329ed6167c9f8032830af8b";
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
    ident = "one-time";
    ldir  = "info/unscoped/o/one-time";
    inherit packument fetchInfo;
  } // latest';

}
