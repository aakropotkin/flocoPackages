{

  inputs.packument.url   = "https://registry.npmjs.org/ltgt?rev=21-f03d23b6c7af152272ab7071aca2e44d";
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
    ident = "ltgt";
    ldir  = "info/unscoped/l/ltgt";
    inherit packument fetchInfo;
  } // latest';

}
