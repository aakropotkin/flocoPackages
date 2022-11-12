{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tx2?_rev=3-b70aeedd4669a8439f13d1fef8d8a368";
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
    ident = "tx2";
    ldir  = "info/unscoped/t/tx2";
    inherit packument fetchInfo;
  } // latest';

}
