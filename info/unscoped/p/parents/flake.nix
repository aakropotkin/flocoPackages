{

  inputs.packument.url   = "https://registry.npmjs.org/parents?rev=19-2c8115eae613db80540c1d418fbe5666";
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
    ident = "parents";
    ldir  = "info/unscoped/p/parents";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
