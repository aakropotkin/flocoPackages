{

  inputs.packument.url   = "https://registry.npmjs.org/@angular/compiler?rev=693-f0934b2b3576aa217ecff2bacb60e2b3";
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
    ident = "@angular/compiler";
    ldir  = "info/angular/compiler";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
