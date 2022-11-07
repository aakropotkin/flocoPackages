{

  inputs.packument.url   = "https://registry.npmjs.org/clone-stats?rev=6-cdaa6d72e6ebb51d6cc07f7fec482fd2";
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
    ident = "clone-stats";
    ldir  = "info/unscoped/c/clone-stats";
    inherit packument fetchInfo;
  } // latest';

}
