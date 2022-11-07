{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-selector-not?rev=22-dbf20782f4e5c06a487373263e138b30";
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
    ident = "postcss-selector-not";
    ldir  = "info/unscoped/p/postcss-selector-not";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
