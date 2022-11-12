{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/workerpool?_rev=61-e4cd9046b7394824a253404f0a02d343";
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
    ident = "workerpool";
    ldir  = "info/unscoped/w/workerpool";
    inherit packument fetchInfo;
  } // latest';

}
