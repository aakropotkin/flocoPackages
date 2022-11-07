{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-reduce-transforms?rev=45-a01d98d25c7e80a78f3479303d1064b6";
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
    ident = "postcss-reduce-transforms";
    ldir  = "info/unscoped/p/postcss-reduce-transforms";
    inherit packument fetchInfo;
  } // latest';

}
