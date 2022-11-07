{

  inputs.packument.url   = "https://registry.npmjs.org/type-check?rev=25-b671e942a82ed11954b9b65628f6d238";
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
    ident = "type-check";
    ldir  = "info/unscoped/t/type-check";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
