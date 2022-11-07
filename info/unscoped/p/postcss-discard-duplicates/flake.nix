{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-discard-duplicates?rev=56-a84748aeecd1a01792d27a0946c3925f";
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
    ident = "postcss-discard-duplicates";
    ldir  = "info/unscoped/p/postcss-discard-duplicates";
    inherit packument fetchInfo;
  } // latest';

}
