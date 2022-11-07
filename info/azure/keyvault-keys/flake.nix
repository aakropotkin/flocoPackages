{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/keyvault-keys?rev=333-e9f5c496f3b7508d2fc39dfa75901f56";
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
    scope = "@azure";
    ident = "@azure/keyvault-keys";
    ldir  = "info/azure/keyvault-keys";
    inherit packument fetchInfo;
  } // latest';

}
