{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/uid2?_rev=20-32b76f0cf7af4c18c5c8425209b32226";
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
    ident = "uid2";
    ldir  = "info/unscoped/u/uid2";
    inherit packument fetchInfo;
  } // latest';

}
