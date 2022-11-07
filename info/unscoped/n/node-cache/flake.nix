{

  inputs.packument.url   = "https://registry.npmjs.org/node-cache?rev=180-b2164367f39abfc929d957ebc85e05cc";
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
    ident = "node-cache";
    ldir  = "info/unscoped/n/node-cache";
    inherit packument fetchInfo;
  } // latest';

}
