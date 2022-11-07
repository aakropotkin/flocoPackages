{

  inputs.packument.url   = "https://registry.npmjs.org/dotenv-expand?rev=21-957baf294f0cfca1260c6882980a3c85";
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
    ident = "dotenv-expand";
    ldir  = "info/unscoped/d/dotenv-expand";
    inherit packument fetchInfo;
  } // latest';

}
