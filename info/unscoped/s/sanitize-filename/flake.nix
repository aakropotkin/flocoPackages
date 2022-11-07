{

  inputs.packument.url   = "https://registry.npmjs.org/sanitize-filename?rev=58-81cb98e7f21b728a3ddc97d6a1fec75c";
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
    ident = "sanitize-filename";
    ldir  = "info/unscoped/s/sanitize-filename";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
