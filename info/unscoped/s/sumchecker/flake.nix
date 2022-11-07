{

  inputs.packument.url   = "https://registry.npmjs.org/sumchecker?rev=14-14b83f40e9eb3a72ba6fd1ff8d5674c3";
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
    ident = "sumchecker";
    ldir  = "info/unscoped/s/sumchecker";
    inherit packument fetchInfo;
  } // latest';

}
