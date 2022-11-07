{

  inputs.packument.url   = "https://registry.npmjs.org/@angular/common?rev=697-a0a27ec4be5f3c79abee833623e8598a";
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
    ident = "@angular/common";
    ldir  = "info/angular/common";
    inherit packument fetchInfo;
  } // latest';

}
