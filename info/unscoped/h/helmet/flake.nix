{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/helmet?_rev=483-a1656a4284550dbdb00d130ec614e2f7";
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
    ident = "helmet";
    ldir  = "info/unscoped/h/helmet";
    inherit packument fetchInfo;
  } // latest';

}
