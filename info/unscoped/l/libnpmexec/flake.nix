{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/libnpmexec?_rev=41-12c6304a149824ba13fdaddc7c804e31";
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
    ident = "libnpmexec";
    ldir  = "info/unscoped/l/libnpmexec";
    inherit packument fetchInfo;
  } // latest';

}
