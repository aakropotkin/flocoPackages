{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/download-git-repo?_rev=52-c1ca62d0489aa338741f7d480c32701d";
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
    ident = "download-git-repo";
    ldir  = "info/unscoped/d/download-git-repo";
    inherit packument fetchInfo;
  } // latest';

}
