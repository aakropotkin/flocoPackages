{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/broccoli-babel-transpiler?_rev=82-ba5b9c7a3615d8819a6815bb84b8617b";
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
    ident = "broccoli-babel-transpiler";
    ldir  = "info/unscoped/b/broccoli-babel-transpiler";
    inherit packument fetchInfo;
  } // latest';

}
