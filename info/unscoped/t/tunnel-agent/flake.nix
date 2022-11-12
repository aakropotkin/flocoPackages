{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tunnel-agent?_rev=25-4a813a8fae1713ef983b5a3f35df15b4";
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
    ident = "tunnel-agent";
    ldir  = "info/unscoped/t/tunnel-agent";
    inherit packument fetchInfo;
  } // latest';

}
