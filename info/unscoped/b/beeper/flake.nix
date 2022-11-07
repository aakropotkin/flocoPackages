{

  inputs.packument.url   = "https://registry.npmjs.org/beeper?rev=29-2e3e3bc999277d4e84a8048798da2dfe";
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
    ident = "beeper";
    ldir  = "info/unscoped/b/beeper";
    inherit packument fetchInfo;
  } // latest';

}
