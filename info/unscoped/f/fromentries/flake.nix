{

  inputs.packument.url   = "https://registry.npmjs.org/fromentries?rev=10-1c8ca8dade2f35b0071d9c5b4c92ea6e";
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
    ident = "fromentries";
    ldir  = "info/unscoped/f/fromentries";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
