{

  inputs.packument.url   = "https://registry.npmjs.org/relateurl?rev=21-03e01ab39f610d1c69e82cb24dbedffa";
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
    ident = "relateurl";
    ldir  = "info/unscoped/r/relateurl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
