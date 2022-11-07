{

  inputs.packument.url   = "https://registry.npmjs.org/arr-map?rev=9-2b0d8786234bcac923781c1b59b0df51";
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
    ident = "arr-map";
    ldir  = "info/unscoped/a/arr-map";
    inherit packument fetchInfo;
  } // latest';

}
