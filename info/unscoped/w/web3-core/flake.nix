{

  inputs.packument.url   = "https://registry.npmjs.org/web3-core?rev=146-7b718ef8023781930c4e42c6e54c521d";
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
    ident = "web3-core";
    ldir  = "info/unscoped/w/web3-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
