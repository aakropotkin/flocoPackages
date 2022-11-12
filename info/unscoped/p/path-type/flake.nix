{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/path-type?_rev=11-0a8d11b3118ef81fc000b9e396e7a869";
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
    ident = "path-type";
    ldir  = "info/unscoped/p/path-type";
    inherit packument fetchInfo;
  } // latest';

}
