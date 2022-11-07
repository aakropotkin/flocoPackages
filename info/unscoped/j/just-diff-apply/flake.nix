{

  inputs.packument.url   = "https://registry.npmjs.org/just-diff-apply?rev=19-c5dab101d633ca43baba5b1d576f8e2c";
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
    ident = "just-diff-apply";
    ldir  = "info/unscoped/j/just-diff-apply";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
