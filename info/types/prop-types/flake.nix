{

  inputs.packument.url   = "https://registry.npmjs.org/@types/prop-types?rev=485-58ce81a8dcb484337196570f8c9d30b5";
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
    scope = "@types";
    ident = "@types/prop-types";
    ldir  = "info/types/prop-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
