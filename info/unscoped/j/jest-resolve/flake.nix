{

  inputs.packument.url   = "https://registry.npmjs.org/jest-resolve?rev=373-58da283513c5af0977fa5be28c3ed1d2";
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
    ident = "jest-resolve";
    ldir  = "info/unscoped/j/jest-resolve";
    inherit packument fetchInfo;
  } // latest';

}
