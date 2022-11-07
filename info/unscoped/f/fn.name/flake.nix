{

  inputs.packument.url   = "https://registry.npmjs.org/fn.name?rev=12-6b10a2787143aa6249d234a0edcfb24a";
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
    ident = "fn.name";
    ldir  = "info/unscoped/f/fn.name";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
