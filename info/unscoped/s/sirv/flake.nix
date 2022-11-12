{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sirv?_rev=48-bad7466a65fe77c4c293bc271ced6041";
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
    ident = "sirv";
    ldir  = "info/unscoped/s/sirv";
    inherit packument fetchInfo;
  } // latest';

}
