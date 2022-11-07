{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-node-info?rev=11-fb35defb58c8bbd15f2683c75cee665d";
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
    ident = "broccoli-node-info";
    ldir  = "info/unscoped/b/broccoli-node-info";
    inherit packument fetchInfo;
  } // latest';

}
