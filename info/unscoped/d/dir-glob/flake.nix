{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dir-glob?_rev=18-9a870423e3769964ce8b275d04420e5a";
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
    ident = "dir-glob";
    ldir  = "info/unscoped/d/dir-glob";
    inherit packument fetchInfo;
  } // latest';

}
