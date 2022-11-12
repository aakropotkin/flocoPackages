{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-transform-sticky-regex?_rev=79-c88b01bbd8e7a0769eea5679b9590b6a";
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
    ident = "@babel/plugin-transform-sticky-regex";
    ldir  = "info/babel/plugin-transform-sticky-regex";
    inherit packument fetchInfo;
  } // latest';

}
