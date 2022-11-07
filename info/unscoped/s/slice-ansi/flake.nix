{

  inputs.packument.url   = "https://registry.npmjs.org/slice-ansi?rev=17-75ec782fc6608fb5040eba68b56e91d9";
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
    ident = "slice-ansi";
    ldir  = "info/unscoped/s/slice-ansi";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
