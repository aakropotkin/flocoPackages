{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-merge-trees?rev=51-e403697fdb692eea5f468c8dee5ad027";
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
    ident = "broccoli-merge-trees";
    ldir  = "info/unscoped/b/broccoli-merge-trees";
    inherit packument fetchInfo;
  } // latest';

}
