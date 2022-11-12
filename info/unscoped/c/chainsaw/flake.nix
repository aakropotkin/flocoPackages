{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/chainsaw?_rev=30-a84452f23cffeade8ee06c4afdc9e7d6";
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
    ident = "chainsaw";
    ldir  = "info/unscoped/c/chainsaw";
    inherit packument fetchInfo;
  } // latest';

}
