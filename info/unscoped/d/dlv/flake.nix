{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dlv?_rev=13-ea0a3a5b13f438804d30117617461b05";
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
    ident = "dlv";
    ldir  = "info/unscoped/d/dlv";
    inherit packument fetchInfo;
  } // latest';

}
