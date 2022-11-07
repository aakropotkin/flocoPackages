{

  inputs.packument.url   = "https://registry.npmjs.org/style-to-object?rev=6-631de6c661499db7f108a1d2867b849c";
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
    ident = "style-to-object";
    ldir  = "info/unscoped/s/style-to-object";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
