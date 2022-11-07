{

  inputs.packument.url   = "https://registry.npmjs.org/web3-providers-http?rev=124-056a1a041ca04528650eef27b464a38e";
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
    ident = "web3-providers-http";
    ldir  = "info/unscoped/w/web3-providers-http";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
