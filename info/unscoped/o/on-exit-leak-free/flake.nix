{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/on-exit-leak-free?_rev=5-3c95e6374f929644afadb96333f18494";
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
    ident = "on-exit-leak-free";
    ldir  = "info/unscoped/o/on-exit-leak-free";
    inherit packument fetchInfo;
  } // latest';

}
