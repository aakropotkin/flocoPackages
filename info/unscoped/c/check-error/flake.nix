{

  inputs.packument.url   = "https://registry.npmjs.org/check-error?rev=6-1db87ac4805efc323dfe959f3cc071bf";
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
    ident = "check-error";
    ldir  = "info/unscoped/c/check-error";
    inherit packument fetchInfo;
  } // latest';

}
