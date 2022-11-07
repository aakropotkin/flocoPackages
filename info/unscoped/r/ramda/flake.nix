{

  inputs.packument.url   = "https://registry.npmjs.org/ramda?rev=253-cec1390b5229fa8742ccc7df785345f0";
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
    ident = "ramda";
    ldir  = "info/unscoped/r/ramda";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
