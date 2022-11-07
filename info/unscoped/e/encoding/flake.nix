{

  inputs.packument.url   = "https://registry.npmjs.org/encoding?rev=42-98eafcc1372a5c3e9e4d5bc9a10dd46d";
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
    ident = "encoding";
    ldir  = "info/unscoped/e/encoding";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
