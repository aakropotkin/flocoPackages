{

  inputs.packument.url   = "https://registry.npmjs.org/npm-user-validate?rev=47-d714183cdda2b4404179703ff9ed9214";
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
    ident = "npm-user-validate";
    ldir  = "info/unscoped/n/npm-user-validate";
    inherit packument fetchInfo;
  } // latest';

}
