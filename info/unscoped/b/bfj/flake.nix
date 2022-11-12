{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bfj?_rev=46-8e7d47ce7a4e72fc089538311a4c32f5";
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
    ident = "bfj";
    ldir  = "info/unscoped/b/bfj";
    inherit packument fetchInfo;
  } // latest';

}
