{

  inputs.packument.url   = "https://registry.npmjs.org/espree?rev=134-31358c347a49f37dafe676159fa69bef";
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
    ident = "espree";
    ldir  = "info/unscoped/e/espree";
    inherit packument fetchInfo;
  } // latest';

}
