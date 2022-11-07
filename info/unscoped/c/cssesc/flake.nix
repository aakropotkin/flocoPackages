{

  inputs.packument.url   = "https://registry.npmjs.org/cssesc?rev=12-948897a55a6eeb34c7e36268fe8470cc";
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
    ident = "cssesc";
    ldir  = "info/unscoped/c/cssesc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
