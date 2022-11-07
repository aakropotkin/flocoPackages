{

  inputs.packument.url   = "https://registry.npmjs.org/fstream?rev=143-9b821c40d3c23a7816a4bdc6084ddd3b";
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
    ident = "fstream";
    ldir  = "info/unscoped/f/fstream";
    inherit packument fetchInfo;
  } // latest';

}
