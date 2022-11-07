{

  inputs.packument.url   = "https://registry.npmjs.org/has-symbols?rev=9-4d7f5f8fd9b1e0675ff88a8f88b1f511";
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
    ident = "has-symbols";
    ldir  = "info/unscoped/h/has-symbols";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
