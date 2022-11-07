{

  inputs.packument.url   = "https://registry.npmjs.org/balanced-match?rev=31-283982e66091b1828f0fb2af537576c8";
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
    ident = "balanced-match";
    ldir  = "info/unscoped/b/balanced-match";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
