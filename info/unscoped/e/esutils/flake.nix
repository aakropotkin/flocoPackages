{

  inputs.packument.url   = "https://registry.npmjs.org/esutils?rev=34-b82961233f8ca4e3e378f3fe16d7312d";
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
    ident = "esutils";
    ldir  = "info/unscoped/e/esutils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
