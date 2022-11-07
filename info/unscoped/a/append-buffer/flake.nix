{

  inputs.packument.url   = "https://registry.npmjs.org/append-buffer?rev=5-dc6ef1d44a50908e9e309ba95c2ddf36";
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
    ident = "append-buffer";
    ldir  = "info/unscoped/a/append-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
