{

  inputs.packument.url   = "https://registry.npmjs.org/@sideway/formula?rev=1-98641b6cac2c683b11abe2b5692bfb08";
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
    scope = "@sideway";
    ident = "@sideway/formula";
    ldir  = "info/sideway/formula";
    inherit packument fetchInfo;
  } // latest';

}
