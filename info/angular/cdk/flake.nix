{

  inputs.packument.url   = "https://registry.npmjs.org/@angular/cdk?rev=359-e1f9b6c0aac34cc9d803f4fc266ea7f5";
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
    ident = "@angular/cdk";
    ldir  = "info/angular/cdk";
    inherit packument fetchInfo;
  } // latest';

}
