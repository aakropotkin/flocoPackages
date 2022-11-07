{

  inputs.packument.url   = "https://registry.npmjs.org/jsonfile?rev=204-ead82c3b45a73d06ca1bcd49a7dd47c9";
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
    ident = "jsonfile";
    ldir  = "info/unscoped/j/jsonfile";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
