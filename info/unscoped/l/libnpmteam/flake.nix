{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/libnpmteam?_rev=44-eb14a27ac773c017a07ae1658878d9f5";
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
    ident = "libnpmteam";
    ldir  = "info/unscoped/l/libnpmteam";
    inherit packument fetchInfo;
  } // latest';

}
