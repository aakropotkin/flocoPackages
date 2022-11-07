{

  inputs.packument.url   = "https://registry.npmjs.org/multicast-dns-service-types?rev=6-aad8958db575697d34f3f03c5eb3cc6b";
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
    ident = "multicast-dns-service-types";
    ldir  = "info/unscoped/m/multicast-dns-service-types";
    inherit packument fetchInfo;
  } // latest';

}
