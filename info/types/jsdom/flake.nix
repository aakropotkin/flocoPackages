{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fjsdom?_rev=824-641fe3049896cf4d85f63f7f6a856316";
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
    ident = "@types/jsdom";
    ldir  = "info/types/jsdom";
    inherit packument fetchInfo;
  } // latest';

}
