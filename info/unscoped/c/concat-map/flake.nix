{

  inputs.packument.url   = "https://registry.npmjs.org/concat-map?rev=13-00c6c66bfe20666201949c13020b82e4";
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
    ident = "concat-map";
    ldir  = "info/unscoped/c/concat-map";
    inherit packument fetchInfo;
  } // latest';

}
