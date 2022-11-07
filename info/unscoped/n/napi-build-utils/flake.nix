{

  inputs.packument.url   = "https://registry.npmjs.org/napi-build-utils?rev=3-f0d72deeb2aca6ffef033960f2bcff52";
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
    ident = "napi-build-utils";
    ldir  = "info/unscoped/n/napi-build-utils";
    inherit packument fetchInfo;
  } // latest';

}
