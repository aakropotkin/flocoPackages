{

  inputs.packument.url   = "https://registry.npmjs.org/@types/generic-pool?rev=653-90d2faf1df8b8c89c4ef852fb085c080";
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
    scope = "@types";
    ident = "@types/generic-pool";
    ldir  = "info/types/generic-pool";
    inherit packument fetchInfo;
  } // latest';

}
