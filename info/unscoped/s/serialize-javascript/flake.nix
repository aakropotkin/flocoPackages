{

  inputs.packument.url   = "https://registry.npmjs.org/serialize-javascript?rev=60-697dbfdc3c2d371c2018c718ad200db9";
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
    ident = "serialize-javascript";
    ldir  = "info/unscoped/s/serialize-javascript";
    inherit packument fetchInfo;
  } // latest';

}
