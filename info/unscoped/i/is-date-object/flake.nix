{

  inputs.packument.url   = "https://registry.npmjs.org/is-date-object?rev=14-17490cd930c6ac8d3390315f30f3f4f5";
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
    ident = "is-date-object";
    ldir  = "info/unscoped/i/is-date-object";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
