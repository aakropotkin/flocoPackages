{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-modules-scope?rev=30-d2a2db32bf97bda7ed8b3a2ce1fee38f";
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
    ident = "postcss-modules-scope";
    ldir  = "info/unscoped/p/postcss-modules-scope";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
