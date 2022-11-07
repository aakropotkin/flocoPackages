{

  inputs.packument.url   = "https://registry.npmjs.org/@jridgewell/set-array?rev=5-32baacc189d0e4970ed4509baf1588f8";
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
    scope = "@jridgewell";
    ident = "@jridgewell/set-array";
    ldir  = "info/jridgewell/set-array";
    inherit packument fetchInfo;
  } // latest';

}
