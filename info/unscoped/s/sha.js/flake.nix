{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sha.js?_rev=81-f54e4b7c08c73be422dcb082fb7085c4";
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
    ident = "sha.js";
    ldir  = "info/unscoped/s/sha.js";
    inherit packument fetchInfo;
  } // latest';

}
