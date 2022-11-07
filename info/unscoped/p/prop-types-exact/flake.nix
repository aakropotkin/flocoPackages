{

  inputs.packument.url   = "https://registry.npmjs.org/prop-types-exact?rev=15-b673edc50c51cf05daf663f12f52539e";
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
    ident = "prop-types-exact";
    ldir  = "info/unscoped/p/prop-types-exact";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
