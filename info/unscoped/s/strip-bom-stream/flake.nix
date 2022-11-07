{

  inputs.packument.url   = "https://registry.npmjs.org/strip-bom-stream?rev=8-78184b91e41f05e03bc6ba8cd7bc73d1";
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
    ident = "strip-bom-stream";
    ldir  = "info/unscoped/s/strip-bom-stream";
    inherit packument fetchInfo;
  } // latest';

}
