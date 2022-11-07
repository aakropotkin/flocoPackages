{

  inputs.packument.url   = "https://registry.npmjs.org/statehood?rev=121-24beab6f7e0983b7a9039005fc885e70";
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
    ident = "statehood";
    ldir  = "info/unscoped/s/statehood";
    inherit packument fetchInfo;
  } // latest';

}
