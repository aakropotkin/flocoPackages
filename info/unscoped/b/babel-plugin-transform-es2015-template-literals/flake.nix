{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-transform-es2015-template-literals?_rev=77-d096bcc98b9cedf649504fedb4375666";
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
    scope = null;
    ident = "babel-plugin-transform-es2015-template-literals";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-template-literals";
    inherit packument fetchInfo;
  } // latest';

}
