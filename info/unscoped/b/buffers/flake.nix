{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/buffers?_rev=16-bcde5d036674a69a5a8a84e5e9ef9c3e";
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
    ident = "buffers";
    ldir  = "info/unscoped/b/buffers";
    inherit packument fetchInfo;
  } // latest';

}
