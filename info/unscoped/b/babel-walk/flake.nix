{

  inputs.packument.url   = "https://registry.npmjs.org/babel-walk?rev=6-dcf4749acb7f7c1af16cb2eb7dc6ad3d";
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
    ident = "babel-walk";
    ldir  = "info/unscoped/b/babel-walk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
