{

  inputs.packument.url   = "https://registry.npmjs.org/glob?rev=823-90c7e77f55f0d84e8e301054fa642c1e";
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
    ident = "glob";
    ldir  = "info/unscoped/g/glob";
    inherit packument fetchInfo;
  } // latest';

}
