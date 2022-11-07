{

  inputs.packument.url   = "https://registry.npmjs.org/omggif?rev=11-4d588e638e0abe5eecfdda640065b91d";
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
    ident = "omggif";
    ldir  = "info/unscoped/o/omggif";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
