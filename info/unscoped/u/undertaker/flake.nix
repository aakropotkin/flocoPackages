{

  inputs.packument.url   = "https://registry.npmjs.org/undertaker?rev=51-23abd428493e9de44af7ef9b29fdd586";
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
    ident = "undertaker";
    ldir  = "info/unscoped/u/undertaker";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
