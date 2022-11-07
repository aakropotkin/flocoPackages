{

  inputs.packument.url   = "https://registry.npmjs.org/jest-runner?rev=242-75f70967f84f078fbdfe50b2e08715b4";
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
