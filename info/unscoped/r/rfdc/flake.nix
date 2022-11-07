{

  inputs.packument.url   = "https://registry.npmjs.org/rfdc?rev=16-91b33ff0aa59d7ddb4c6e644e4d3be7b";
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
    ident = "rfdc";
    ldir  = "info/unscoped/r/rfdc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
