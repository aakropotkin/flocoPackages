{

  inputs.packument.url   = "https://registry.npmjs.org/ansi-align?rev=13-e0e0ff70bbd284dadda471e37d93c7de";
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
    ident = "ansi-align";
    ldir  = "info/unscoped/a/ansi-align";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
