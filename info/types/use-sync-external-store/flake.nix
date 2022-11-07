{

  inputs.packument.url   = "https://registry.npmjs.org/@types/use-sync-external-store?rev=44-29b6134a4cd7f594137400c13e7f44e3";
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
    scope = "@types";
    ident = "@types/use-sync-external-store";
    ldir  = "info/types/use-sync-external-store";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
