{

  inputs.packument.url   = "https://registry.npmjs.org/connect-history-api-fallback?rev=42-26a367d2bb371fb88b9b48568b1e0632";
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
    ident = "connect-history-api-fallback";
    ldir  = "info/unscoped/c/connect-history-api-fallback";
    inherit packument fetchInfo;
  } // latest';

}
