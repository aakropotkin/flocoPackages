{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@codemirror/lint?_rev=22-6ae56de415f5283c539213dabc2f2968";
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
    ident = "@codemirror/lint";
    ldir  = "info/codemirror/lint";
    inherit packument fetchInfo;
  } // latest';

}
