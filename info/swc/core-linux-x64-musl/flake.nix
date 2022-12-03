{

  inputs.packument.url   = "https://registry.npmjs.org/@swc/core-linux-x64-musl";
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
    scope = "@swc";
    ident = "@swc/core-linux-x64-musl";
    ldir  = "info/swc/core-linux-x64-musl";
    inherit packument fetchInfo;
  } // latest';

}
