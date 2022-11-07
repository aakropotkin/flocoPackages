{

  inputs.packument.url   = "https://registry.npmjs.org/stream-combiner?rev=51-744d7a52ece9ba51d662c09fd727c98b";
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
    ident = "stream-combiner";
    ldir  = "info/unscoped/s/stream-combiner";
    inherit packument fetchInfo;
  } // latest';

}
