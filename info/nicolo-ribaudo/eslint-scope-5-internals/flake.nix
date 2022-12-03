{

  inputs.packument.url   = "https://registry.npmjs.org/@nicolo-ribaudo/eslint-scope-5-internals";
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
    scope = "@nicolo-ribaudo";
    ident = "@nicolo-ribaudo/eslint-scope-5-internals";
    ldir  = "info/nicolo-ribaudo/eslint-scope-5-internals";
    inherit packument fetchInfo;
  } // latest';

}
