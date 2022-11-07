{

  inputs.packument.url   = "https://registry.npmjs.org/deep-diff?rev=94-2b1dc89b76162b00d686c5f1cacd0639";
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
    ident = "deep-diff";
    ldir  = "info/unscoped/d/deep-diff";
    inherit packument fetchInfo;
  } // latest';

}
