{

  inputs.packument.url   = "https://registry.npmjs.org/is-glob?rev=40-f56d27263584a30c7a81e103774ca879";
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
    ident = "is-glob";
    ldir  = "info/unscoped/i/is-glob";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
