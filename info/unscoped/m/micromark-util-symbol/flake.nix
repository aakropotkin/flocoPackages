{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-symbol?rev=6-92eb1a0bba8facb73e64d05812661121";
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
    ident = "micromark-util-symbol";
    ldir  = "info/unscoped/m/micromark-util-symbol";
    inherit packument fetchInfo;
  } // latest';

}
