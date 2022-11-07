{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.omit?rev=47-e215a7a7ed9a82ab9d1965ad8d79a564";
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
    ident = "lodash.omit";
    ldir  = "info/unscoped/l/lodash.omit";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
