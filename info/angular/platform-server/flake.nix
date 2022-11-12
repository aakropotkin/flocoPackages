{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular%2fplatform-server?_rev=685-828279b72a4f7cb293229cc0eff536a6";
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
    ident = "@angular/platform-server";
    ldir  = "info/angular/platform-server";
    inherit packument fetchInfo;
  } // latest';

}
