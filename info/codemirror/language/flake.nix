{

  inputs.packument.url   = "https://registry.npmjs.org/@codemirror/language?rev=28-bb47c2c8961e1eff30c9fd6f71baaa69";
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
    ident = "@codemirror/language";
    ldir  = "info/codemirror/language";
    inherit packument fetchInfo;
  } // latest';

}
