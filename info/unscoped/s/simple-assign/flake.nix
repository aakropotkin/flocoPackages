{

  inputs.packument.url   = "https://registry.npmjs.org/simple-assign?rev=3-c290d748272d21fb67d4aebf1a97344b";
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
    ident = "simple-assign";
    ldir  = "info/unscoped/s/simple-assign";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
