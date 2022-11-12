{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/raw-body?_rev=103-987c7048d555624e723ffa827035c390";
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
    ident = "raw-body";
    ldir  = "info/unscoped/r/raw-body";
    inherit packument fetchInfo;
  } // latest';

}
