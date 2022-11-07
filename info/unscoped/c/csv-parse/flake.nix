{

  inputs.packument.url   = "https://registry.npmjs.org/csv-parse?rev=170-229e13d92b23f5fa021d06525ee3d0ea";
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
    ident = "csv-parse";
    ldir  = "info/unscoped/c/csv-parse";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
