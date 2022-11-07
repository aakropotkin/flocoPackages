{

  inputs.packument.url   = "https://registry.npmjs.org/import-lazy?rev=6-c36bbd8040a4e6c8a1ed4b32cd0bf753";
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
    ident = "import-lazy";
    ldir  = "info/unscoped/i/import-lazy";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
