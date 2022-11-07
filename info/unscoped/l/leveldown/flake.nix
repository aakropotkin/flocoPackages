{

  inputs.packument.url   = "https://registry.npmjs.org/leveldown?rev=213-b3da6b68e55cd0c240f2cb72882c656a";
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
    ident = "leveldown";
    ldir  = "info/unscoped/l/leveldown";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
