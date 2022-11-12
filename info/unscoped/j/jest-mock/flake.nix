{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-mock?_rev=341-f89060b50be5c74c9c2445df63001f45";
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
    ident = "jest-mock";
    ldir  = "info/unscoped/j/jest-mock";
    inherit packument fetchInfo;
  } // latest';

}
