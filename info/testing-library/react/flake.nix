{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@testing-library%2freact?_rev=112-e751e71246c95ac853b4b50aebca74e8";
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
    ident = "@testing-library/react";
    ldir  = "info/testing-library/react";
    inherit packument fetchInfo;
  } // latest';

}
