{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-syntax-async-generators?_rev=71-4638ed20cb5f3f3ebe09d6ec13dd90a6";
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
    scope = "@babel";
    ident = "@babel/plugin-syntax-async-generators";
    ldir  = "info/babel/plugin-syntax-async-generators";
    inherit packument fetchInfo;
  } // latest';

}
