{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-node-api?rev=14-0c425bc7fb2c0a562dac8f5284e59262";
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
    ident = "broccoli-node-api";
    ldir  = "info/unscoped/b/broccoli-node-api";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
