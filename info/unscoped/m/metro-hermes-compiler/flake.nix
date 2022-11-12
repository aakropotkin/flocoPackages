{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/metro-hermes-compiler?_rev=36-c69c971c8b2cebc7a79f6dcec1638675";
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
    ident = "metro-hermes-compiler";
    ldir  = "info/unscoped/m/metro-hermes-compiler";
    inherit packument fetchInfo;
  } // latest';

}
