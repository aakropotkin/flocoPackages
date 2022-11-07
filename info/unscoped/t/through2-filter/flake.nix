{

  inputs.packument.url   = "https://registry.npmjs.org/through2-filter?rev=30-f125802a824ce241dccebbb1ec783091";
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
    ident = "through2-filter";
    ldir  = "info/unscoped/t/through2-filter";
    inherit packument fetchInfo;
  } // latest';

}
