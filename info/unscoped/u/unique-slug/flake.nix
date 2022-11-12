{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/unique-slug?_rev=34-5eb961fa9bf306d869c9804135273fcc";
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
    ident = "unique-slug";
    ldir  = "info/unscoped/u/unique-slug";
    inherit packument fetchInfo;
  } // latest';

}
