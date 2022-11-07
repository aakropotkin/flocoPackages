{

  inputs.packument.url   = "https://registry.npmjs.org/web3-net?rev=137-0a1c02c5b0916e52d46a167e565ea14a";
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
    ident = "web3-net";
    ldir  = "info/unscoped/w/web3-net";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
