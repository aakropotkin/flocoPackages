{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-reference?_rev=14-ccef82b49dd69a0b34b1043fa0a33dfe";
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
    ident = "is-reference";
    ldir  = "info/unscoped/i/is-reference";
    inherit packument fetchInfo;
  } // latest';

}
