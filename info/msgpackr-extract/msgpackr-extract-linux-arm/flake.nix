{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@msgpackr-extract%2fmsgpackr-extract-linux-arm?_rev=4-e7540be79828885af4e5aa4340e1564e";
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
    ident = "@msgpackr-extract/msgpackr-extract-linux-arm";
    ldir  = "info/msgpackr-extract/msgpackr-extract-linux-arm";
    inherit packument fetchInfo;
  } // latest';

}
