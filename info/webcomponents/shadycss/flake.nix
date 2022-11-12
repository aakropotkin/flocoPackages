{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webcomponents/shadycss?_rev=50-0be63afd754a750e04f66a9009f341f3";
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
    scope = "@webcomponents";
    ident = "@webcomponents/shadycss";
    ldir  = "info/webcomponents/shadycss";
    inherit packument fetchInfo;
  } // latest';

}
