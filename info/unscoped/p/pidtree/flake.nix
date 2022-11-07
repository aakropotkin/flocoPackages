{

  inputs.packument.url   = "https://registry.npmjs.org/pidtree?rev=11-876f9b3ab07ccc9d28f74d53e1009f37";
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
    ident = "pidtree";
    ldir  = "info/unscoped/p/pidtree";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
