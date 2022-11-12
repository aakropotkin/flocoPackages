{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@react-aria%2fssr?_rev=369-630ad87a1e5c82805e4858072ee410a5";
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
    scope = "@react-aria";
    ident = "@react-aria/ssr";
    ldir  = "info/react-aria/ssr";
    inherit packument fetchInfo;
  } // latest';

}
