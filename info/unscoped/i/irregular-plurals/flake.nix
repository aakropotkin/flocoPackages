{

  inputs.packument.url   = "https://registry.npmjs.org/irregular-plurals?rev=15-7b30b67c71a959e7e31dd98e8f020991";
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
    ident = "irregular-plurals";
    ldir  = "info/unscoped/i/irregular-plurals";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
