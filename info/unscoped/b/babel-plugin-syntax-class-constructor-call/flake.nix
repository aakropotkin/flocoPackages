{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-syntax-class-constructor-call?_rev=49-04ba0fb7bf2d91e50fcf0b9c03a5016a";
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
    ident = "babel-plugin-syntax-class-constructor-call";
    ldir  = "info/unscoped/b/babel-plugin-syntax-class-constructor-call";
    inherit packument fetchInfo;
  } // latest';

}
