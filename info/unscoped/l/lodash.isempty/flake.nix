{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.isempty?rev=50-ea754436be2ca9c8aa947f2a1eb78c8b";
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
    ident = "lodash.isempty";
    ldir  = "info/unscoped/l/lodash.isempty";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
