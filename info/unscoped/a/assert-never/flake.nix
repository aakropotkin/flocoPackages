{

  inputs.packument.url   = "https://registry.npmjs.org/assert-never?rev=6-c114affc2d78319204851bc437d124d0";
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
    ident = "assert-never";
    ldir  = "info/unscoped/a/assert-never";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
