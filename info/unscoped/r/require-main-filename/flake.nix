{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/require-main-filename?_rev=6-4bc1b3c7658156e5bd206b0c1010f54b";
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
    ident = "require-main-filename";
    ldir  = "info/unscoped/r/require-main-filename";
    inherit packument fetchInfo;
  } // latest';

}
