{

  inputs.packument.url   = "https://registry.npmjs.org/style-equal?rev=3-4008adfa610c0695715e4dd212c0a784";
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
    ident = "style-equal";
    ldir  = "info/unscoped/s/style-equal";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
