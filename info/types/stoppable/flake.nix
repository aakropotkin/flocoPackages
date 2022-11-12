{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fstoppable?_rev=462-d3b9762112b92173a93a764c4e0235c1";
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
    scope = "@types";
    ident = "@types/stoppable";
    ldir  = "info/types/stoppable";
    inherit packument fetchInfo;
  } // latest';

}
