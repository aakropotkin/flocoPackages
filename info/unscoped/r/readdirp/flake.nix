{

  inputs.packument.url   = "https://registry.npmjs.org/readdirp?rev=112-b7ee92dda26a2e0d4360ae23ef41f43b";
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
    ident = "readdirp";
    ldir  = "info/unscoped/r/readdirp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
