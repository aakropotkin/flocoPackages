{

  inputs.packument.url   = "https://registry.npmjs.org/fragment-cache?rev=5-c5360501cddd48b497259f7f5d1c4160";
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
    ident = "fragment-cache";
    ldir  = "info/unscoped/f/fragment-cache";
    inherit packument fetchInfo;
  } // latest';

}
