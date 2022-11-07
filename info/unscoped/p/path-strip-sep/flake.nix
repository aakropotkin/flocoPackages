{

  inputs.packument.url   = "https://registry.npmjs.org/path-strip-sep?rev=10-b8804e0a8fed58a69585eb78f2431a7c";
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
    ident = "path-strip-sep";
    ldir  = "info/unscoped/p/path-strip-sep";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
