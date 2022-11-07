{

  inputs.packument.url   = "https://registry.npmjs.org/unzip?rev=84-4189301fcb6435eca5d1b08c11d5a3da";
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
    ident = "unzip";
    ldir  = "info/unscoped/u/unzip";
    inherit packument fetchInfo;
  } // latest';

}
