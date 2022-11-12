{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-jest-hoist?_rev=295-ba86f7ec548da55c54f41cd4572f9318";
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
    ident = "babel-plugin-jest-hoist";
    ldir  = "info/unscoped/b/babel-plugin-jest-hoist";
    inherit packument fetchInfo;
  } // latest';

}
