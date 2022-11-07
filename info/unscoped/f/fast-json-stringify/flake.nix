{

  inputs.packument.url   = "https://registry.npmjs.org/fast-json-stringify?rev=155-3deab0fb9ddf86f81abe6d9013e0315d";
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
    ident = "fast-json-stringify";
    ldir  = "info/unscoped/f/fast-json-stringify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
