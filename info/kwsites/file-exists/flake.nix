{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@kwsites%2ffile-exists?_rev=3-22669b4ff6f36a2e3661e56f4048c513";
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
    scope = "@kwsites";
    ident = "@kwsites/file-exists";
    ldir  = "info/kwsites/file-exists";
    inherit packument fetchInfo;
  } // latest';

}
