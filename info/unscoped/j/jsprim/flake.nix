{

  inputs.packument.url   = "https://registry.npmjs.org/jsprim?rev=77-aa4324d913e45496a3135d61f1a2ac15";
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
    ident = "jsprim";
    ldir  = "info/unscoped/j/jsprim";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
