{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@sideway/pinpoint?_rev=1-ecfdb43bac3cb547e4fb81b83a4f3deb";
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
    scope = "@sideway";
    ident = "@sideway/pinpoint";
    ldir  = "info/sideway/pinpoint";
    inherit packument fetchInfo;
  } // latest';

}
