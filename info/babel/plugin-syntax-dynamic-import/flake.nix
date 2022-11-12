{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-syntax-dynamic-import?_rev=69-91cd2f60d084c8d7b7812e32b950039e";
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
    ident = "@babel/plugin-syntax-dynamic-import";
    ldir  = "info/babel/plugin-syntax-dynamic-import";
    inherit packument fetchInfo;
  } // latest';

}
