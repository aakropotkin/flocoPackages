{

  inputs.packument.url   = "https://registry.npmjs.org/brace-expansion?rev=33-2dda4af2cd1e8fbef6ba81ed26cbe077";
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
    ident = "brace-expansion";
    ldir  = "info/unscoped/b/brace-expansion";
    inherit packument fetchInfo;
  } // latest';

}
