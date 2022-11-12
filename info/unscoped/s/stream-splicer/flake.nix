{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-splicer?_rev=67-490c35792a95b7f871001d4c1f9faa16";
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
    ident = "stream-splicer";
    ldir  = "info/unscoped/s/stream-splicer";
    inherit packument fetchInfo;
  } // latest';

}
