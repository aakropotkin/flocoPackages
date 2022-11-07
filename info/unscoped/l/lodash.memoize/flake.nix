{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.memoize?rev=51-4484ad5bf3b1a7e2136fc31de2caa6ee";
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
    ident = "lodash.memoize";
    ldir  = "info/unscoped/l/lodash.memoize";
    inherit packument fetchInfo;
  } // latest';

}
