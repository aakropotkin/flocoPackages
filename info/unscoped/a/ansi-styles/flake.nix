{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ansi-styles?_rev=88-c2e5152bc09847000645c5767a440b9e";
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
    ident = "ansi-styles";
    ldir  = "info/unscoped/a/ansi-styles";
    inherit packument fetchInfo;
  } // latest';

}
