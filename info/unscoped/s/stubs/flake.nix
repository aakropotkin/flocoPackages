{

  inputs.packument.url   = "https://registry.npmjs.org/stubs?rev=12-c07d73481c0cd20f2a65e8c6753f7f39";
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
    ident = "stubs";
    ldir  = "info/unscoped/s/stubs";
    inherit packument fetchInfo;
  } // latest';

}
