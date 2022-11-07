{

  inputs.packument.url   = "https://registry.npmjs.org/token-types?rev=46-869f4e30a230a7d4ea3e2c33450589e8";
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
    ident = "token-types";
    ldir  = "info/unscoped/t/token-types";
    inherit packument fetchInfo;
  } // latest';

}
