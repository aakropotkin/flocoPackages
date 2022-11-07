{

  inputs.packument.url   = "https://registry.npmjs.org/delegates?rev=45-4bc7f61a9fb1e6e18d290044b2c002a1";
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
    ident = "delegates";
    ldir  = "info/unscoped/d/delegates";
    inherit packument fetchInfo;
  } // latest';

}
