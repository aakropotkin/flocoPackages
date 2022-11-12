{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sprintf?_rev=44-b73788055bd7cbbbb057f47013ff3f3d";
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
    ident = "sprintf";
    ldir  = "info/unscoped/s/sprintf";
    inherit packument fetchInfo;
  } // latest';

}
