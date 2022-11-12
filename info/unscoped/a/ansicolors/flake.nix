{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ansicolors?_rev=20-eb820b0b6717a7503c6c6bc16751c56c";
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
    ident = "ansicolors";
    ldir  = "info/unscoped/a/ansicolors";
    inherit packument fetchInfo;
  } // latest';

}
