{

  inputs.packument.url   = "https://registry.npmjs.org/@types/istanbul-lib-coverage?rev=481-0065b78dbad8b1aa47da8ff9dd058afb";
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
    scope = "@types";
    ident = "@types/istanbul-lib-coverage";
    ldir  = "info/types/istanbul-lib-coverage";
    inherit packument fetchInfo;
  } // latest';

}
