{

  inputs.packument.url   = "https://registry.npmjs.org/stylelint?rev=294-cefb7e23ed8ca270d7f236b5165ca2b4";
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
    ident = "stylelint";
    ldir  = "info/unscoped/s/stylelint";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
