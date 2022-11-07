{

  inputs.packument.url   = "https://registry.npmjs.org/sax?rev=147-368c7892af7ab0d2a0f1f90879c46378";
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
    ident = "sax";
    ldir  = "info/unscoped/s/sax";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
