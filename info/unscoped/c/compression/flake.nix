{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/compression?_rev=304-867153afcb4e676124b52230d31a097b";
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
    ident = "compression";
    ldir  = "info/unscoped/c/compression";
    inherit packument fetchInfo;
  } // latest';

}
