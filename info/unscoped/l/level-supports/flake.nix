{

  inputs.packument.url   = "https://registry.npmjs.org/level-supports?rev=9-62cddc4733880a5bdc7a73b2e19e3664";
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
    ident = "level-supports";
    ldir  = "info/unscoped/l/level-supports";
    inherit packument fetchInfo;
  } // latest';

}
