{

  inputs.packument.url   = "https://registry.npmjs.org/vlq?rev=19-7ed5b4abef48051908747d04e57ade12";
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
    ident = "vlq";
    ldir  = "info/unscoped/v/vlq";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
