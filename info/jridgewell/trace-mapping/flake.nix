{

  inputs.packument.url   = "https://registry.npmjs.org/@jridgewell/trace-mapping";
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
    ident = "@jridgewell/trace-mapping";
    ldir  = "info/jridgewell/trace-mapping";
    inherit packument fetchInfo;
  } // latest';

}
