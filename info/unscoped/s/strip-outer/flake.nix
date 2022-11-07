{

  inputs.packument.url   = "https://registry.npmjs.org/strip-outer?rev=7-e6fd233106fb387cac607e4339997a94";
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
    ident = "strip-outer";
    ldir  = "info/unscoped/s/strip-outer";
    inherit packument fetchInfo;
  } // latest';

}
