{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/qrcode-terminal?_rev=70-719c8cc9b010381938b4b6e78b5c3b5c";
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
    ident = "qrcode-terminal";
    ldir  = "info/unscoped/q/qrcode-terminal";
    inherit packument fetchInfo;
  } // latest';

}
