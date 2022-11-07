{

  inputs.packument.url   = "https://registry.npmjs.org/select-hose?rev=4-4cd9bf0cacf016bff836add9d879779f";
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
    ident = "select-hose";
    ldir  = "info/unscoped/s/select-hose";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
