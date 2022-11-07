{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-from?rev=10-3b2356a528dd0653c34fea2ebc334a8b";
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
    ident = "buffer-from";
    ldir  = "info/unscoped/b/buffer-from";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
