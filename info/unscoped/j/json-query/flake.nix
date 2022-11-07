{

  inputs.packument.url   = "https://registry.npmjs.org/json-query?rev=87-93ffe82c2a05ab6c0974d78279ffc512";
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
    ident = "json-query";
    ldir  = "info/unscoped/j/json-query";
    inherit packument fetchInfo;
  } // latest';

}
