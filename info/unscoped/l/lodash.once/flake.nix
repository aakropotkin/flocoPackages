{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.once?rev=38-1ef2aa2d380ea41c04f879f310ff810b";
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
    ident = "lodash.once";
    ldir  = "info/unscoped/l/lodash.once";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
