{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/object-assign?_rev=127-45861cdc17175ffc8f36ff38ef86fbb8";
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
    ident = "object-assign";
    ldir  = "info/unscoped/o/object-assign";
    inherit packument fetchInfo;
  } // latest';

}
