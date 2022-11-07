{

  inputs.packument.url   = "https://registry.npmjs.org/prop-types-extra?rev=6-418357d99d50a02a4a071020bdd43a87";
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
    ident = "prop-types-extra";
    ldir  = "info/unscoped/p/prop-types-extra";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
