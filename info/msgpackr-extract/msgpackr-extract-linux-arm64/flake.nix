{

  inputs.packument.url   = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-arm64";
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
    scope = "@msgpackr-extract";
    ident = "@msgpackr-extract/msgpackr-extract-linux-arm64";
    ldir  = "info/msgpackr-extract/msgpackr-extract-linux-arm64";
    inherit packument fetchInfo;
  } // latest';

}
