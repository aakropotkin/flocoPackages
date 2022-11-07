{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.isfunction?rev=45-3028c580867f6cce5c3e1532ee250bb2";
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
    ident = "lodash.isfunction";
    ldir  = "info/unscoped/l/lodash.isfunction";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
