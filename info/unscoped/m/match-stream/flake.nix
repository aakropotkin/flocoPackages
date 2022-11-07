{

  inputs.packument.url   = "https://registry.npmjs.org/match-stream?rev=10-ddb50ec5746ca0e290e9a59d3e0faeb1";
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
    ident = "match-stream";
    ldir  = "info/unscoped/m/match-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
