{

  inputs.packument.url   = "https://registry.npmjs.org/es6-error?rev=26-0b83d97bcd1d8586abe19b216c533c87";
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
    ident = "es6-error";
    ldir  = "info/unscoped/e/es6-error";
    inherit packument fetchInfo;
  } // latest';

}
