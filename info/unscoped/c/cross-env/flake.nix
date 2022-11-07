{

  inputs.packument.url   = "https://registry.npmjs.org/cross-env?rev=414-1eb889d205cd8bb890ec9a8748084789";
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
    ident = "cross-env";
    ldir  = "info/unscoped/c/cross-env";
    inherit packument fetchInfo;
  } // latest';

}
