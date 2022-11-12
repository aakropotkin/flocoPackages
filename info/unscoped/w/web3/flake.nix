{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/web3?_rev=227-059e64100005487ea4eaec24b074b5ac";
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
    ident = "web3";
    ldir  = "info/unscoped/w/web3";
    inherit packument fetchInfo;
  } // latest';

}
