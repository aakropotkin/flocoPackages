{

  inputs.packument.url   = "https://registry.npmjs.org/p-event?rev=20-33435958c8adcdcdc9a1c7cafa29a640";
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
    ident = "p-event";
    ldir  = "info/unscoped/p/p-event";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
