{

  inputs.packument.url   = "https://registry.npmjs.org/reduce-css-calc?rev=45-1794cd4ecb66b8f53d2184d791a9eebf";
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
    ident = "reduce-css-calc";
    ldir  = "info/unscoped/r/reduce-css-calc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
