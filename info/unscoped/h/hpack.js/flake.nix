{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hpack.js?_rev=13-61306de882e0e84694de1d236372fbf8";
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
    ident = "hpack.js";
    ldir  = "info/unscoped/h/hpack.js";
    inherit packument fetchInfo;
  } // latest';

}
