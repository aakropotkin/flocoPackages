{

  inputs.packument.url   = "https://registry.npmjs.org/resolve-dir?rev=9-b542e8b2d6b8c8df56f888b18de82cd0";
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
    ident = "resolve-dir";
    ldir  = "info/unscoped/r/resolve-dir";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
