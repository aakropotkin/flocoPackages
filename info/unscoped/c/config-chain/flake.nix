{

  inputs.packument.url   = "https://registry.npmjs.org/config-chain?rev=63-a3e89baaf594ebc83fce4af3b6d9a8f1";
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
    ident = "config-chain";
    ldir  = "info/unscoped/c/config-chain";
    inherit packument fetchInfo;
  } // latest';

}
