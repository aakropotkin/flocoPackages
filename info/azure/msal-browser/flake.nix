{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/msal-browser?_rev=61-64da386318784a42f5d135edd793ed05";
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
    ident = "@azure/msal-browser";
    ldir  = "info/azure/msal-browser";
    inherit packument fetchInfo;
  } // latest';

}
