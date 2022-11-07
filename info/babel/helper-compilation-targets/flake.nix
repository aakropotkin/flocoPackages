{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-compilation-targets?rev=42-6e59d4b92b8412766df9d1985f599c96";
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
    scope = "@babel";
    ident = "@babel/helper-compilation-targets";
    ldir  = "info/babel/helper-compilation-targets";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
