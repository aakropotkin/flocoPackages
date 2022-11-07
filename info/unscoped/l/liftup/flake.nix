{

  inputs.packument.url   = "https://registry.npmjs.org/liftup?rev=1-b591ecd8610250f534abc016578b1dfb";
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
    ident = "liftup";
    ldir  = "info/unscoped/l/liftup";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
