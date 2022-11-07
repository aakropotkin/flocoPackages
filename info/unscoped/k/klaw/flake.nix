{

  inputs.packument.url   = "https://registry.npmjs.org/klaw?rev=32-5781970a4c881c1b211d2ecb23c38ab0";
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
    ident = "klaw";
    ldir  = "info/unscoped/k/klaw";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
