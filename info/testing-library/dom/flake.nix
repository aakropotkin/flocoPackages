{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@testing-library/dom?_rev=222-8fce4461de5e4631e982c6b7bda2a193";
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
    scope = "@testing-library";
    ident = "@testing-library/dom";
    ldir  = "info/testing-library/dom";
    inherit packument fetchInfo;
  } // latest';

}
