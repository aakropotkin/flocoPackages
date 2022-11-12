{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/git-node-fs?_rev=10-88904faf4b56e5924221366be8029690";
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
    ident = "git-node-fs";
    ldir  = "info/unscoped/g/git-node-fs";
    inherit packument fetchInfo;
  } // latest';

}
