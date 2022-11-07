{

  inputs.packument.url   = "https://registry.npmjs.org/parent-module?rev=10-ca332e83be5713197f2e200a93beac3e";
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
    ident = "parent-module";
    ldir  = "info/unscoped/p/parent-module";
    inherit packument fetchInfo;
  } // latest';

}
