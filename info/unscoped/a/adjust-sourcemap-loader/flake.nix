{

  inputs.packument.url   = "https://registry.npmjs.org/adjust-sourcemap-loader?rev=16-c5ea98e02b7f7654480c70dd821dd3a2";
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
    ident = "adjust-sourcemap-loader";
    ldir  = "info/unscoped/a/adjust-sourcemap-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
