{

  inputs.packument.url   = "https://registry.npmjs.org/identity-obj-proxy";
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
    ident = "identity-obj-proxy";
    ldir  = "info/unscoped/i/identity-obj-proxy";
    inherit packument fetchInfo;
  } // latest';

}
