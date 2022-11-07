{

  inputs.packument.url   = "https://registry.npmjs.org/jest-runner?rev=243-d8f22f178d45670b2c24e568c9aca2a1";
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
    ident = "jest-runner";
    ldir  = "info/unscoped/j/jest-runner";
    inherit packument fetchInfo;
  } // latest';

}
