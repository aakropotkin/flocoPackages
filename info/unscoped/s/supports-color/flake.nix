{

  inputs.packument.url   = "https://registry.npmjs.org/supports-color?rev=96-f26eafe82823b388e343e37b71a09f8c";
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
    ident = "supports-color";
    ldir  = "info/unscoped/s/supports-color";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
