{

  inputs.packument.url   = "https://registry.npmjs.org/scss-tokenizer?rev=16-941bad0566bf5e45df67fe8b566fc6ca";
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
    ident = "scss-tokenizer";
    ldir  = "info/unscoped/s/scss-tokenizer";
    inherit packument fetchInfo;
  } // latest';

}
