{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@phosphor%2fdisposable?_rev=25-a27c9d6e3b1370886af905ee2eb2ed14";
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
    scope = "@phosphor";
    ident = "@phosphor/disposable";
    ldir  = "info/phosphor/disposable";
    inherit packument fetchInfo;
  } // latest';

}
