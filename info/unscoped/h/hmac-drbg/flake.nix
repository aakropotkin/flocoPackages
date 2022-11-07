{

  inputs.packument.url   = "https://registry.npmjs.org/hmac-drbg?rev=3-eee1951a081df2c6815a6f2fbdafbf96";
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
    ident = "hmac-drbg";
    ldir  = "info/unscoped/h/hmac-drbg";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
