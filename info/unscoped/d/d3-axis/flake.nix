{

  inputs.packument.url   = "https://registry.npmjs.org/d3-axis?rev=32-23838367ec37dcc148d5b0d9a8d139e2";
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
    ident = "d3-axis";
    ldir  = "info/unscoped/d/d3-axis";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
