{

  inputs.packument.url   = "https://registry.npmjs.org/jest-snapshot?rev=385-a1fae9e6498db5ef3d849c16d016b004";
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
    ident = "jest-snapshot";
    ldir  = "info/unscoped/j/jest-snapshot";
    inherit packument fetchInfo;
  } // latest';

}
