{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/path-dirname?_rev=8-3e35d80a661832d4ee17e922857be718";
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
    ident = "path-dirname";
    ldir  = "info/unscoped/p/path-dirname";
    inherit packument fetchInfo;
  } // latest';

}
