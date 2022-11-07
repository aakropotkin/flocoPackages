{

  inputs.packument.url   = "https://registry.npmjs.org/fast-uri?rev=10-7c96c2dec243b2c7037852c09cdef445";
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
    ident = "fast-uri";
    ldir  = "info/unscoped/f/fast-uri";
    inherit packument fetchInfo;
  } // latest';

}
