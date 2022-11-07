{

  inputs.packument.url   = "https://registry.npmjs.org/jsonc-parser?rev=145-1cc9f0650ab5d8f88f41dffd917cd37d";
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
    ident = "jsonc-parser";
    ldir  = "info/unscoped/j/jsonc-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
