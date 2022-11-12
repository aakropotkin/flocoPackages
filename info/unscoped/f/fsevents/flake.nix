{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fsevents?_rev=244-20c143bc18408bd7536939dcc3818618";
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
    ident = "fsevents";
    ldir  = "info/unscoped/f/fsevents";
    inherit packument fetchInfo;
  } // latest';

}
