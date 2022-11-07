{

  inputs.packument.url   = "https://registry.npmjs.org/neo-async?rev=137-2e6d530a99bd529dfc1540d1133d6bd3";
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
    ident = "neo-async";
    ldir  = "info/unscoped/n/neo-async";
    inherit packument fetchInfo;
  } // latest';

}
