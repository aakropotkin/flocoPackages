{

  inputs.packument.url   = "https://registry.npmjs.org/@jridgewell/sourcemap-codec?rev=6-869194427bdd92e1461975bbaa9218ea";
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
    scope = "@jridgewell";
    ident = "@jridgewell/sourcemap-codec";
    ldir  = "info/jridgewell/sourcemap-codec";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
