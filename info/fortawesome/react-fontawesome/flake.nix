{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@fortawesome%2freact-fontawesome?_rev=74-c06cd0738d12482af71ce3ac96997889";
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
    scope = "@fortawesome";
    ident = "@fortawesome/react-fontawesome";
    ldir  = "info/fortawesome/react-fontawesome";
    inherit packument fetchInfo;
  } // latest';

}
