{

  inputs.packument.url   = "https://registry.npmjs.org/fs-tree-diff?rev=32-39c4b301e8f19fa5b96c8cbc962dd988";
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
    ident = "fs-tree-diff";
    ldir  = "info/unscoped/f/fs-tree-diff";
    inherit packument fetchInfo;
  } // latest';

}
