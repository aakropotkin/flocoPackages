{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-haste-map?_rev=381-170a1370517e1d9b653ae4d26a034fc6";
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
    ident = "jest-haste-map";
    ldir  = "info/unscoped/j/jest-haste-map";
    inherit packument fetchInfo;
  } // latest';

}
