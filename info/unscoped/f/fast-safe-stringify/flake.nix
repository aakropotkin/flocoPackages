{

  inputs.packument.url   = "https://registry.npmjs.org/fast-safe-stringify?rev=74-970cbb62b3f3594c8b575278730bc9a7";
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
    ident = "fast-safe-stringify";
    ldir  = "info/unscoped/f/fast-safe-stringify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
