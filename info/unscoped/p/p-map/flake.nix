{

  inputs.packument.url   = "https://registry.npmjs.org/p-map?rev=25-43b82ef9cb6b214919254e6fa5f555da";
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
    ident = "p-map";
    ldir  = "info/unscoped/p/p-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
