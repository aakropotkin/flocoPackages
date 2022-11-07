{

  inputs.packument.url   = "https://registry.npmjs.org/apollo-utilities?rev=115-1a97a8134e3fe03e8bccdb95bf3dae71";
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
    ident = "apollo-utilities";
    ldir  = "info/unscoped/a/apollo-utilities";
    inherit packument fetchInfo;
  } // latest';

}
