{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/prettyjson?_rev=129-5bb57b7e8d9c8e5834789b09c8c79b0e";
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
    ident = "prettyjson";
    ldir  = "info/unscoped/p/prettyjson";
    inherit packument fetchInfo;
  } // latest';

}
