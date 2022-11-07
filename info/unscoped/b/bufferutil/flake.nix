{

  inputs.packument.url   = "https://registry.npmjs.org/bufferutil?rev=36-838dfdd2c67ae5855eb06b554a7829ae";
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
    ident = "bufferutil";
    ldir  = "info/unscoped/b/bufferutil";
    inherit packument fetchInfo;
  } // latest';

}
