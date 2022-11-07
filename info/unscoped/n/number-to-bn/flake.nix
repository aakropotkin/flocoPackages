{

  inputs.packument.url   = "https://registry.npmjs.org/number-to-bn?rev=10-6417a7361ea562dc6fe1264d57250ff6";
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
    ident = "number-to-bn";
    ldir  = "info/unscoped/n/number-to-bn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
