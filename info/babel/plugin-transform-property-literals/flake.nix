{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-transform-property-literals?_rev=78-ea3bfdad7b384b5a3dc0fe963ffb697c";
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
    ident = "@babel/plugin-transform-property-literals";
    ldir  = "info/babel/plugin-transform-property-literals";
    inherit packument fetchInfo;
  } // latest';

}
