{

  inputs.packument.url   = "https://registry.npmjs.org/module-details-from-path?rev=6-a19f00008a1f662711c1ac2b1f5fc27d";
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
    ident = "module-details-from-path";
    ldir  = "info/unscoped/m/module-details-from-path";
    inherit packument fetchInfo;
  } // latest';

}
