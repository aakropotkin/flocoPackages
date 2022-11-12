{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest?_rev=674-2641659c28795889b9d3a6942419ce7e";
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
    ident = "jest";
    ldir  = "info/unscoped/j/jest";
    inherit packument fetchInfo;
  } // latest';

}
