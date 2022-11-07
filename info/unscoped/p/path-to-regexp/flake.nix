{

  inputs.packument.url   = "https://registry.npmjs.org/path-to-regexp?rev=266-696fe060d2454c91e1d7f48a9660bd25";
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
    ident = "path-to-regexp";
    ldir  = "info/unscoped/p/path-to-regexp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
