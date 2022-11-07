{

  inputs.packument.url   = "https://registry.npmjs.org/parallel-transform?rev=26-c531eb08bf58bc04388b553070059526";
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
    ident = "parallel-transform";
    ldir  = "info/unscoped/p/parallel-transform";
    inherit packument fetchInfo;
  } // latest';

}
