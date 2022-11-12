{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/parse5-htmlparser2-tree-adapter?_rev=8-38f950e34d59b03459b5c59a40090b18";
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
    ident = "parse5-htmlparser2-tree-adapter";
    ldir  = "info/unscoped/p/parse5-htmlparser2-tree-adapter";
    inherit packument fetchInfo;
  } // latest';

}
