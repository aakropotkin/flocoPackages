{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/spdx-expression-parse?_rev=15-1a73de9d3f4443fe7902b2191f5b658b";
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
    ident = "spdx-expression-parse";
    ldir  = "info/unscoped/s/spdx-expression-parse";
    inherit packument fetchInfo;
  } // latest';

}
