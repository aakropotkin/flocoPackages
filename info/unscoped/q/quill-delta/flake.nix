{

  inputs.packument.url   = "https://registry.npmjs.org/quill-delta?rev=24-40b8b2236e154701db174fb696e04736";
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
    ident = "quill-delta";
    ldir  = "info/unscoped/q/quill-delta";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
