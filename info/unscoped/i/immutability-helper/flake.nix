{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/immutability-helper?_rev=45-ee7a8a4c5dfcf11a506b7bee3a593b80";
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
    ident = "immutability-helper";
    ldir  = "info/unscoped/i/immutability-helper";
    inherit packument fetchInfo;
  } // latest';

}
