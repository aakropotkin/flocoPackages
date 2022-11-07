{

  inputs.packument.url   = "https://registry.npmjs.org/secp256k1?rev=86-f73379234b01eaaf49bb9b9b03ebc06d";
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
    ident = "secp256k1";
    ldir  = "info/unscoped/s/secp256k1";
    inherit packument fetchInfo;
  } // latest';

}
