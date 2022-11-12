{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pkg-conf?_rev=14-72972928b5dd9769472c198afedb763c";
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
    ident = "pkg-conf";
    ldir  = "info/unscoped/p/pkg-conf";
    inherit packument fetchInfo;
  } // latest';

}
