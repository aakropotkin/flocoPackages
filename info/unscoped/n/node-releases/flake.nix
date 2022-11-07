{

  inputs.packument.url   = "https://registry.npmjs.org/node-releases?rev=108-30e0116d9ced272c4ca7ec9eb9fd49b9";
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
    ident = "node-releases";
    ldir  = "info/unscoped/n/node-releases";
    inherit packument fetchInfo;
  } // latest';

}
