{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/csstype?_rev=88-a285353698ecf05d5d7c18b73dad9cc5";
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
    ident = "csstype";
    ldir  = "info/unscoped/c/csstype";
    inherit packument fetchInfo;
  } // latest';

}
