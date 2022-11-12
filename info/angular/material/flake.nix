{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular%2fmaterial?_rev=419-3647e05029e34e10535adbd028630044";
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
    scope = "@angular";
    ident = "@angular/material";
    ldir  = "info/angular/material";
    inherit packument fetchInfo;
  } // latest';

}
