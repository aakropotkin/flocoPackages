{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-overflow-shorthand?rev=9-8ac584d450111aa7e2bb6c183488890b";
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
    ident = "postcss-overflow-shorthand";
    ldir  = "info/unscoped/p/postcss-overflow-shorthand";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
