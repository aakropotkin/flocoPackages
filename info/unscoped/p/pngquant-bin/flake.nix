{

  inputs.packument.url   = "https://registry.npmjs.org/pngquant-bin?rev=301-aeaad814c8c53a55499a518db5bf433b";
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
    ident = "pngquant-bin";
    ldir  = "info/unscoped/p/pngquant-bin";
    inherit packument fetchInfo;
  } // latest';

}
