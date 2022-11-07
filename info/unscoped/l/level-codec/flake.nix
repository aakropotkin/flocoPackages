{

  inputs.packument.url   = "https://registry.npmjs.org/level-codec?rev=49-e58b26008c1e0c18828f431c76d5b66c";
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
    ident = "level-codec";
    ldir  = "info/unscoped/l/level-codec";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
