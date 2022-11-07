{

  inputs.packument.url   = "https://registry.npmjs.org/stylehacks?rev=49-0b9137bfaa37cfe6062eb48b61fa2306";
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
    ident = "stylehacks";
    ldir  = "info/unscoped/s/stylehacks";
    inherit packument fetchInfo;
  } // latest';

}
