{

  inputs.packument.url   = "https://registry.npmjs.org/has-flag?rev=16-c315872d5b8ffee8fecd0e69c571f1aa";
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
    ident = "has-flag";
    ldir  = "info/unscoped/h/has-flag";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
