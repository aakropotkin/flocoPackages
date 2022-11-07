{

  inputs.packument.url   = "https://registry.npmjs.org/is-arrayish?rev=12-f946f297e65d074595aa996e7816e8e8";
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
    ident = "is-arrayish";
    ldir  = "info/unscoped/i/is-arrayish";
    inherit packument fetchInfo;
  } // latest';

}
