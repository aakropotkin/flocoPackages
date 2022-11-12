{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/highlight?_rev=60-9fe090eda8c64cfd37c8d4e45e8a30e1";
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
    scope = "@babel";
    ident = "@babel/highlight";
    ldir  = "info/babel/highlight";
    inherit packument fetchInfo;
  } // latest';

}
