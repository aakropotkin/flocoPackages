{

  inputs.packument.url   = "https://registry.npmjs.org/mailhog?rev=32-4b20981b780f76ee4834cd2640658f73";
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
    ident = "mailhog";
    ldir  = "info/unscoped/m/mailhog";
    inherit packument fetchInfo;
  } // latest';

}
