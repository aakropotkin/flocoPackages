{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular/compiler-cli?_rev=684-26510cae47bc5ee586039ab77259bc2a";
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
    ident = "@angular/compiler-cli";
    ldir  = "info/angular/compiler-cli";
    inherit packument fetchInfo;
  } // latest';

}
