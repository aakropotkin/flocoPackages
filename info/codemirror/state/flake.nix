{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@codemirror/state?_rev=28-00cc15a90b198eebf1122ba1ea9e4b06";
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
    scope = "@codemirror";
    ident = "@codemirror/state";
    ldir  = "info/codemirror/state";
    inherit packument fetchInfo;
  } // latest';

}
