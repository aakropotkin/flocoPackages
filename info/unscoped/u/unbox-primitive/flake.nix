{

  inputs.packument.url   = "https://registry.npmjs.org/unbox-primitive?rev=3-726ddfe02bb573f4aae0d3eff02d8026";
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
    ident = "unbox-primitive";
    ldir  = "info/unscoped/u/unbox-primitive";
    inherit packument fetchInfo;
  } // latest';

}
