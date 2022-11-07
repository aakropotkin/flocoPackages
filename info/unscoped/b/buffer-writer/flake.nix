{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-writer?rev=9-495431c7899c1f326b4fa85544fc4520";
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
    ident = "buffer-writer";
    ldir  = "info/unscoped/b/buffer-writer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
