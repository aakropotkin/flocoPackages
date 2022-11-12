{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-version?_rev=13-253b104a894781548b693aba604a8e48";
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
    ident = "node-version";
    ldir  = "info/unscoped/n/node-version";
    inherit packument fetchInfo;
  } // latest';

}
