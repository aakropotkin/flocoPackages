{

  inputs.packument.url   = "https://registry.npmjs.org/express?rev=4003-96c1a032db52c5f0a8646f5650bb2a84";
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
    ident = "express";
    ldir  = "info/unscoped/e/express";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
