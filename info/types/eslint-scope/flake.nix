{

  inputs.packument.url   = "https://registry.npmjs.org/@types/eslint-scope?rev=493-f19798f09ebaab49e27e7a2416e814df";
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
    ident = "@types/eslint-scope";
    ldir  = "info/types/eslint-scope";
    inherit packument fetchInfo;
  } // latest';

}
