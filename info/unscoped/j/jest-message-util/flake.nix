{

  inputs.packument.url   = "https://registry.npmjs.org/jest-message-util?rev=221-ded2356e9bea09d853de791f3ee4b93c";
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
    ident = "jest-message-util";
    ldir  = "info/unscoped/j/jest-message-util";
    inherit packument fetchInfo;
  } // latest';

}
