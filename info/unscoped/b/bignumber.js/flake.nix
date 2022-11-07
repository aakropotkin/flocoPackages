{

  inputs.packument.url   = "https://registry.npmjs.org/bignumber.js?rev=126-23f82058f105ddebc3c963250b33a25b";
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
    ident = "bignumber.js";
    ldir  = "info/unscoped/b/bignumber.js";
    inherit packument fetchInfo;
  } // latest';

}
