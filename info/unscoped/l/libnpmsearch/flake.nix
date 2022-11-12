{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/libnpmsearch?_rev=46-41a4a8df7119a9b3f998e0d1576b1e81";
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
    ident = "libnpmsearch";
    ldir  = "info/unscoped/l/libnpmsearch";
    inherit packument fetchInfo;
  } // latest';

}
