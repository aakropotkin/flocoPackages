{

  inputs.packument.url   = "https://registry.npmjs.org/table-layout?rev=28-e50e4fcee94c08f8c9e7949c5a5548b9";
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
    ident = "table-layout";
    ldir  = "info/unscoped/t/table-layout";
    inherit packument fetchInfo;
  } // latest';

}
