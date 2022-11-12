{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/editorconfig?_rev=49-f312545dd79c68716b6082692138d829";
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
    ident = "editorconfig";
    ldir  = "info/unscoped/e/editorconfig";
    inherit packument fetchInfo;
  } // latest';

}
