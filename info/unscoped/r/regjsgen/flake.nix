{

  inputs.packument.url   = "https://registry.npmjs.org/regjsgen?rev=23-c3c49fd9ad551608aac7e2cac41dbb1f";
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
    ident = "regjsgen";
    ldir  = "info/unscoped/r/regjsgen";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
