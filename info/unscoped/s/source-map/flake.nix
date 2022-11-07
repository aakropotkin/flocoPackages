{

  inputs.packument.url   = "https://registry.npmjs.org/source-map?rev=199-a48f1013b286c73aef98144f4701d2a1";
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
    ident = "source-map";
    ldir  = "info/unscoped/s/source-map";
    inherit packument fetchInfo;
  } // latest';

}
