{

  inputs.packument.url   = "https://registry.npmjs.org/keyv?rev=55-fbb11eecc2ad67413687c50def28eda2";
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
    ident = "keyv";
    ldir  = "info/unscoped/k/keyv";
    inherit packument fetchInfo;
  } // latest';

}
