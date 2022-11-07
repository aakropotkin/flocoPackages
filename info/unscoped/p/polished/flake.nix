{

  inputs.packument.url   = "https://registry.npmjs.org/polished?rev=112-31a14f620ed660f95a896b38a4b89ff7";
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
    ident = "polished";
    ldir  = "info/unscoped/p/polished";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
