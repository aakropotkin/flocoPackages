{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@lumino%2fkeyboard?_rev=37-678cba808101854ab192c3820970086e";
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
    scope = "@lumino";
    ident = "@lumino/keyboard";
    ldir  = "info/lumino/keyboard";
    inherit packument fetchInfo;
  } // latest';

}
