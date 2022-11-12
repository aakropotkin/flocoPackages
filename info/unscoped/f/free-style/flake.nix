{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/free-style?_rev=74-52a8ce4aadf35d1260e1b4edb26dbf27";
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
    ident = "free-style";
    ldir  = "info/unscoped/f/free-style";
    inherit packument fetchInfo;
  } // latest';

}
