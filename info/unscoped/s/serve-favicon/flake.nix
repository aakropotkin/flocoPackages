{

  inputs.packument.url   = "https://registry.npmjs.org/serve-favicon?rev=179-b35b5bdf35fc459cbb4337bd2a9dbb2c";
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
    ident = "serve-favicon";
    ldir  = "info/unscoped/s/serve-favicon";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
