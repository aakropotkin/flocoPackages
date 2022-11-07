{

  inputs.packument.url   = "https://registry.npmjs.org/d3-scale?rev=74-6f8b8fcf19d94385d30d45e2d45e8b5d";
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
    ident = "d3-scale";
    ldir  = "info/unscoped/d/d3-scale";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
