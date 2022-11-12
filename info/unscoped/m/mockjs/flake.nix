{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mockjs?_rev=43-dc23057b69d49abb63870caddbbc590a";
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
    ident = "mockjs";
    ldir  = "info/unscoped/m/mockjs";
    inherit packument fetchInfo;
  } // latest';

}
