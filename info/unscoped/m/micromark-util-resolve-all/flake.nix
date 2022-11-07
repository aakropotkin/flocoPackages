{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-resolve-all?rev=5-50dc7a515d5c9c83936748a661b09f5f";
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
    ident = "micromark-util-resolve-all";
    ldir  = "info/unscoped/m/micromark-util-resolve-all";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
