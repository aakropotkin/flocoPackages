{

  inputs.packument.url   = "https://registry.npmjs.org/array-tree-filter?rev=11-72a2a07b32bfcba9157c127b5939f952";
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
    ident = "array-tree-filter";
    ldir  = "info/unscoped/a/array-tree-filter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
