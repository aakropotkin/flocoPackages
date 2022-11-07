{

  inputs.packument.url   = "https://registry.npmjs.org/methods?rev=42-16305ef23d9cb67fe2ec11512e6b169c";
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
    ident = "methods";
    ldir  = "info/unscoped/m/methods";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
