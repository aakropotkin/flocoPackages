{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@pnpm%2fnetwork.ca-file";
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
    scope = "@pnpm";
    ident = "@pnpm/network.ca-file";
    ldir  = "info/pnpm/network.ca-file";
    inherit packument fetchInfo;
  } // latest';

}
