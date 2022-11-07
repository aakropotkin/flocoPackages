{

  inputs.packument.url   = "https://registry.npmjs.org/jest-runtime?rev=424-02f7a5a5f43beea2119b2fc05c02b958";
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
    ident = "jest-runtime";
    ldir  = "info/unscoped/j/jest-runtime";
    inherit packument fetchInfo;
  } // latest';

}
