{

  inputs.packument.url   = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-win32-x64?rev=4-246a7542b8d23a2ec404fa77067b1b05";
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
    ident = "@msgpackr-extract/msgpackr-extract-win32-x64";
    ldir  = "info/msgpackr-extract/msgpackr-extract-win32-x64";
    inherit packument fetchInfo;
  } // latest';

}
