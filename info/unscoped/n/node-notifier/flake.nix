{

  inputs.packument.url   = "https://registry.npmjs.org/node-notifier?rev=358-730fd9bfdc2f7ddc5ec089ef2fa4017e";
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
    ident = "node-notifier";
    ldir  = "info/unscoped/n/node-notifier";
    inherit packument fetchInfo;
  } // latest';

}
