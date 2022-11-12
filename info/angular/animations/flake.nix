{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular/animations?_rev=643-c1e03bb36ff7b4c5878484993befd96f";
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
    ident = "@angular/animations";
    ldir  = "info/angular/animations";
    inherit packument fetchInfo;
  } // latest';

}
