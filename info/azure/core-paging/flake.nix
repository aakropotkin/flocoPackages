{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/core-paging?rev=124-ad9a201af03f0e0115e6f74334d7d0e3";
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
    scope = "@azure";
    ident = "@azure/core-paging";
    ldir  = "info/azure/core-paging";
    inherit packument fetchInfo;
  } // latest';

}
