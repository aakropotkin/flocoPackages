{

  inputs.packument.url   = "https://registry.npmjs.org/coffee-script?rev=591-547c050d951c242a0aca65d20a462571";
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
    ident = "coffee-script";
    ldir  = "info/unscoped/c/coffee-script";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
