{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/memory-fs?_rev=36-e7a5f816d4a3511a6d43aafc70daa1c3";
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
    ident = "memory-fs";
    ldir  = "info/unscoped/m/memory-fs";
    inherit packument fetchInfo;
  } // latest';

}
