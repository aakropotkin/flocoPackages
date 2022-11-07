{

  inputs.packument.url   = "https://registry.npmjs.org/mock-require?rev=42-48a71f34a5bdb9466d4ab11324794d75";
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
    ident = "mock-require";
    ldir  = "info/unscoped/m/mock-require";
    inherit packument fetchInfo;
  } // latest';

}
