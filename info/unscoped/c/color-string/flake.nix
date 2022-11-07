{

  inputs.packument.url   = "https://registry.npmjs.org/color-string?rev=60-9476d625a0c56fd9f03149cf8b85355a";
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
    ident = "color-string";
    ldir  = "info/unscoped/c/color-string";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
