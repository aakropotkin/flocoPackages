{

  inputs.packument.url   = "https://registry.npmjs.org/bin-check?rev=29-8172e8e9255111d731800218fe77c89e";
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
    ident = "bin-check";
    ldir  = "info/unscoped/b/bin-check";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
