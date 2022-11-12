{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular%2fforms?_rev=684-88bf3d45ce514111627c004ad11b7a63";
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
    ident = "@angular/forms";
    ldir  = "info/angular/forms";
    inherit packument fetchInfo;
  } // latest';

}
