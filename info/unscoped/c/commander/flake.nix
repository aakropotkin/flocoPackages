{

  inputs.packument.url   = "https://registry.npmjs.org/commander?rev=1400-7265ee0e8e0a9680f4aa2d2368b8cf2a";
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
    ident = "commander";
    ldir  = "info/unscoped/c/commander";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
