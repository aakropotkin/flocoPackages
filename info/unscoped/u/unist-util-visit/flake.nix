{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/unist-util-visit?_rev=29-857a7f3c78719de659810bd9393a63a2";
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
    ident = "unist-util-visit";
    ldir  = "info/unscoped/u/unist-util-visit";
    inherit packument fetchInfo;
  } // latest';

}
