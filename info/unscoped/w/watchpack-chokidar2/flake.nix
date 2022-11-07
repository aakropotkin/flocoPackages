{

  inputs.packument.url   = "https://registry.npmjs.org/watchpack-chokidar2?rev=2-3b474cf23fe0e5be94265b52d4e2a68f";
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
    ident = "watchpack-chokidar2";
    ldir  = "info/unscoped/w/watchpack-chokidar2";
    inherit packument fetchInfo;
  } // latest';

}
