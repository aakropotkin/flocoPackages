{

  inputs.packument.url   = "https://registry.npmjs.org/pleeease-filters?rev=37-b10fad51cf13cfb4ddd3e24da2620cb0";
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
    ident = "pleeease-filters";
    ldir  = "info/unscoped/p/pleeease-filters";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
