{

  inputs.packument.url   = "https://registry.npmjs.org/@csstools/selector-specificity?rev=3-50518be131e7d47c21af1b2be7255ee3";
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
    scope = "@csstools";
    ident = "@csstools/selector-specificity";
    ldir  = "info/csstools/selector-specificity";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
