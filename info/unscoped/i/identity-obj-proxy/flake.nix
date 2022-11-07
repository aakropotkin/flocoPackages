{

  inputs.packument.url   = "https://registry.npmjs.org/identity-obj-proxy?rev=11-80d34c5811087a180f6029aff152ac4d";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
