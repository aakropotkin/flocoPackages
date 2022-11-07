{

  inputs.packument.url   = "https://registry.npmjs.org/web3-shh?rev=129-400fd9957dd81ca76a7afaf2c23eb4a4";
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
    ident = "web3-shh";
    ldir  = "info/unscoped/w/web3-shh";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
