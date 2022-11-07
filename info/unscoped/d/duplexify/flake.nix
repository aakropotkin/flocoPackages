{

  inputs.packument.url   = "https://registry.npmjs.org/duplexify?rev=70-7ed947eebe3d0ada9201dd95f1c1b253";
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
    ident = "duplexify";
    ldir  = "info/unscoped/d/duplexify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
