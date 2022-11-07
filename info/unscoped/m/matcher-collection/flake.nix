{

  inputs.packument.url   = "https://registry.npmjs.org/matcher-collection?rev=14-1b4087323b5d3052e54014a4e4cd69d1";
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
    ident = "matcher-collection";
    ldir  = "info/unscoped/m/matcher-collection";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
