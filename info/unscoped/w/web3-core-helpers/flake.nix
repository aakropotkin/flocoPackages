{

  inputs.packument.url   = "https://registry.npmjs.org/web3-core-helpers?rev=141-8de459d7a3e818ce18a024bbfadb436f";
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
    ident = "web3-core-helpers";
    ldir  = "info/unscoped/w/web3-core-helpers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
