{

  inputs.packument.url   = "https://registry.npmjs.org/web3-providers-ws?rev=117-f65af3e0839e0b52e3520c14626dfe92";
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
    ident = "web3-providers-ws";
    ldir  = "info/unscoped/w/web3-providers-ws";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
