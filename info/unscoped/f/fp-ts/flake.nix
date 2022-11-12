{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fp-ts?_rev=229-998b85ea785ec75d1b1807d31f898797";
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
    ident = "fp-ts";
    ldir  = "info/unscoped/f/fp-ts";
    inherit packument fetchInfo;
  } // latest';

}
