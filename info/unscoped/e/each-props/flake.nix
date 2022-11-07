{

  inputs.packument.url   = "https://registry.npmjs.org/each-props?rev=15-ece26ee10d0dca0b15540076e2a9d73a";
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
    ident = "each-props";
    ldir  = "info/unscoped/e/each-props";
    inherit packument fetchInfo;
  } // latest';

}
