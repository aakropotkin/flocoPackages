{

  inputs.packument.url   = "https://registry.npmjs.org/remove-bom-buffer?rev=3-a0569ea8ce6a60a400551c19d3d00589";
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
    ident = "remove-bom-buffer";
    ldir  = "info/unscoped/r/remove-bom-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
