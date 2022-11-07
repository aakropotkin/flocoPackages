{

  inputs.packument.url   = "https://registry.npmjs.org/extract-stack?rev=7-65813e77dde51c12327c8d34748300af";
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
    ident = "extract-stack";
    ldir  = "info/unscoped/e/extract-stack";
    inherit packument fetchInfo;
  } // latest';

}
