{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/file-selector?_rev=33-411213ea8ba031a4aa98090a301b47e3";
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
    ident = "file-selector";
    ldir  = "info/unscoped/f/file-selector";
    inherit packument fetchInfo;
  } // latest';

}
