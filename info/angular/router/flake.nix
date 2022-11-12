{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular%2frouter?_rev=722-988e358d85cb69fd76519508aea872b0";
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
    ident = "@angular/router";
    ldir  = "info/angular/router";
    inherit packument fetchInfo;
  } // latest';

}
