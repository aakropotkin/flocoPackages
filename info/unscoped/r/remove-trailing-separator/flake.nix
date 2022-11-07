{

  inputs.packument.url   = "https://registry.npmjs.org/remove-trailing-separator?rev=7-37943f61e3c70157c5b0e6dcb521e3ad";
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
    ident = "remove-trailing-separator";
    ldir  = "info/unscoped/r/remove-trailing-separator";
    inherit packument fetchInfo;
  } // latest';

}
