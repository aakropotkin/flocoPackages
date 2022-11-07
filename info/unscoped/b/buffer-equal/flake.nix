{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-equal?rev=14-a5d93cc15e86a22119b6a574ffb3eede";
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
    ident = "buffer-equal";
    ldir  = "info/unscoped/b/buffer-equal";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
