{

  inputs.packument.url   = "https://registry.npmjs.org/lie?rev=92-10d03d7f83d0f9de8a1290c98280d13d";
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
    ident = "lie";
    ldir  = "info/unscoped/l/lie";
    inherit packument fetchInfo;
  } // latest';

}
