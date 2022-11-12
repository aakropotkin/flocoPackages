{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/co?_rev=347-a9ef6dd4c6ffb6067bbb012ceab8eeb3";
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
    ident = "co";
    ldir  = "info/unscoped/c/co";
    inherit packument fetchInfo;
  } // latest';

}
