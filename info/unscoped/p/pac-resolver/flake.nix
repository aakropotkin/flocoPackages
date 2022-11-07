{

  inputs.packument.url   = "https://registry.npmjs.org/pac-resolver?rev=35-3e188c81345cb17e705505d527df8a5d";
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
    ident = "pac-resolver";
    ldir  = "info/unscoped/p/pac-resolver";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
