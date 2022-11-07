{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-module-resolver?rev=55-4db720a37ff7b609b93cbd80fe7bdcf4";
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
    ident = "babel-plugin-module-resolver";
    ldir  = "info/unscoped/b/babel-plugin-module-resolver";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
