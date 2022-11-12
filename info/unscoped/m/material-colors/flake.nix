{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/material-colors?_rev=24-caadea501dd83c02c7025d8bdc407f3a";
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
    ident = "material-colors";
    ldir  = "info/unscoped/m/material-colors";
    inherit packument fetchInfo;
  } // latest';

}
