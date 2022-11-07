{

  inputs.packument.url   = "https://registry.npmjs.org/bower?rev=1067-b87056beebc02fb922e7c45e26dc709a";
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
    ident = "bower";
    ldir  = "info/unscoped/b/bower";
    inherit packument fetchInfo;
  } // latest';

}
