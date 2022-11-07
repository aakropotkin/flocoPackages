{

  inputs.packument.url   = "https://registry.npmjs.org/jest-environment-jsdom?rev=391-b7d3d6b7f6935f0ce2a2a36bdde6b868";
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
    ident = "jest-environment-jsdom";
    ldir  = "info/unscoped/j/jest-environment-jsdom";
    inherit packument fetchInfo;
  } // latest';

}
