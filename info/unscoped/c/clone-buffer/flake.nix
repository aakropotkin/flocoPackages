{

  inputs.packument.url   = "https://registry.npmjs.org/clone-buffer?rev=7-a4bff458625488ef98efea5590f23612";
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
    ident = "clone-buffer";
    ldir  = "info/unscoped/c/clone-buffer";
    inherit packument fetchInfo;
  } // latest';

}
