{

  inputs.packument.url   = "https://registry.npmjs.org/set-blocking?rev=5-ba6f0bb5d39fe53d5522291e3d478d77";
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
    ident = "set-blocking";
    ldir  = "info/unscoped/s/set-blocking";
    inherit packument fetchInfo;
  } // latest';

}
