{

  inputs.packument.url   = "https://registry.npmjs.org/node-domexception?rev=1-bdb66f62ed421eca8fd67370f6c9c032";
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
    ident = "node-domexception";
    ldir  = "info/unscoped/n/node-domexception";
    inherit packument fetchInfo;
  } // latest';

}
