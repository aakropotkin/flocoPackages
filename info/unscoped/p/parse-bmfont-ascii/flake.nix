{

  inputs.packument.url   = "https://registry.npmjs.org/parse-bmfont-ascii";
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
    ident = "parse-bmfont-ascii";
    ldir  = "info/unscoped/p/parse-bmfont-ascii";
    inherit packument fetchInfo;
  } // latest';

}
