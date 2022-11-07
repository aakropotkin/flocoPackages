{

  inputs.packument.url   = "https://registry.npmjs.org/gifwrap?rev=33-03feecf08f72316cb91f34ab6eb11a1e";
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
    ident = "gifwrap";
    ldir  = "info/unscoped/g/gifwrap";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
