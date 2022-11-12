{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sockjs?_rev=118-dc28bea0c1a1770008097b940739388f";
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
    ident = "sockjs";
    ldir  = "info/unscoped/s/sockjs";
    inherit packument fetchInfo;
  } // latest';

}
