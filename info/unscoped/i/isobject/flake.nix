{

  inputs.packument.url   = "https://registry.npmjs.org/isobject?rev=24-4323b31019715e18b7f6d7532116c27c";
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
    ident = "isobject";
    ldir  = "info/unscoped/i/isobject";
    inherit packument fetchInfo;
  } // latest';

}
