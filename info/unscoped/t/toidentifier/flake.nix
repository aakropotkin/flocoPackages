{

  inputs.packument.url   = "https://registry.npmjs.org/toidentifier?rev=7-bdf3a62827cc4ee2e391b3c8e445910d";
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
    ident = "toidentifier";
    ldir  = "info/unscoped/t/toidentifier";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
