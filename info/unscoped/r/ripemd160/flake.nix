{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ripemd160?_rev=25-ae6e2954aac7aa497fe1b8b03b926bb3";
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
    ident = "ripemd160";
    ldir  = "info/unscoped/r/ripemd160";
    inherit packument fetchInfo;
  } // latest';

}
