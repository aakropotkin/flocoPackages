{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/msal-common?rev=62-407467b8177ac7d66e13e7c6da2bf499";
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
    ident = "@azure/msal-common";
    ldir  = "info/azure/msal-common";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
