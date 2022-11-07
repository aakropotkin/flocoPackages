{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-types?rev=7-4eb1af0cc9777790fdc62417312661e8";
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
    ident = "micromark-util-types";
    ldir  = "info/unscoped/m/micromark-util-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
