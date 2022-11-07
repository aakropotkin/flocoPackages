{

  inputs.packument.url   = "https://registry.npmjs.org/strtok3?rev=104-1046362335f7950ee16853346f594784";
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
    ident = "strtok3";
    ldir  = "info/unscoped/s/strtok3";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
