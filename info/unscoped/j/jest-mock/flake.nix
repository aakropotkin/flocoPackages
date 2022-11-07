{

  inputs.packument.url   = "https://registry.npmjs.org/jest-mock?rev=340-c17a6567301672a480768b2b8b1d5221";
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
    ident = "jest-mock";
    ldir  = "info/unscoped/j/jest-mock";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
