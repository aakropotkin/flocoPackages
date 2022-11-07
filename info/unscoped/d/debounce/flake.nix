{

  inputs.packument.url   = "https://registry.npmjs.org/debounce?rev=63-4884d7029dec72230870febc839220f9";
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
    ident = "debounce";
    ldir  = "info/unscoped/d/debounce";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
