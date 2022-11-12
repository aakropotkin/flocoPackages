{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hexoid?_rev=2-cc750a30afa98d58064be518b2628d5f";
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
    ident = "hexoid";
    ldir  = "info/unscoped/h/hexoid";
    inherit packument fetchInfo;
  } // latest';

}
