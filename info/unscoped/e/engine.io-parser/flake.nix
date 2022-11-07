{

  inputs.packument.url   = "https://registry.npmjs.org/engine.io-parser?rev=71-67c21c8671d2a0db2ec4f3089ec4c95b";
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
    ident = "engine.io-parser";
    ldir  = "info/unscoped/e/engine.io-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
