{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/agent-base?_rev=31-71caff714b71f86d9b3b61d09e43ad72";
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
    ident = "agent-base";
    ldir  = "info/unscoped/a/agent-base";
    inherit packument fetchInfo;
  } // latest';

}
