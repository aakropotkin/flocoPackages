{

  inputs.packument.url   = "https://registry.npmjs.org/hooker?rev=16-0796769f2d377f9e4720dbb9fc8029e4";
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
    ident = "hooker";
    ldir  = "info/unscoped/h/hooker";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
