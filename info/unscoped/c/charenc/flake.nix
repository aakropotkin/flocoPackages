{

  inputs.packument.url   = "https://registry.npmjs.org/charenc?rev=9-f500900410565c82ae2ddd636ab064df";
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
    ident = "charenc";
    ldir  = "info/unscoped/c/charenc";
    inherit packument fetchInfo;
  } // latest';

}
