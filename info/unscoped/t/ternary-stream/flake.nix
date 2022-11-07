{

  inputs.packument.url   = "https://registry.npmjs.org/ternary-stream?rev=27-af20ae362944cb570d7edf55c8062cc9";
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
    ident = "ternary-stream";
    ldir  = "info/unscoped/t/ternary-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
