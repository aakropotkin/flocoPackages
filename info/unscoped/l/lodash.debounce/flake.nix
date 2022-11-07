{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.debounce?rev=59-92a78b239bb54a013b54ae0ff63cce2b";
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
    ident = "lodash.debounce";
    ldir  = "info/unscoped/l/lodash.debounce";
    inherit packument fetchInfo;
  } // latest';

}
