{

  inputs.packument.url   = "https://registry.npmjs.org/path-key?rev=12-e95bac2e06769a60022f9e5e2a6e3245";
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
    ident = "path-key";
    ldir  = "info/unscoped/p/path-key";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
