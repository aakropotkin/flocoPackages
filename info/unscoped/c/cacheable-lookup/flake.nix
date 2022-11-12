{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cacheable-lookup?_rev=37-e39b75573d62e69239303fa464efd49b";
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
    ident = "cacheable-lookup";
    ldir  = "info/unscoped/c/cacheable-lookup";
    inherit packument fetchInfo;
  } // latest';

}
