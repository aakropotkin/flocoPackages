{

  inputs.packument.url   = "https://registry.npmjs.org/boolean?rev=52-f63b5c7d1e592396d69cc039ca0f50c5";
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
    ident = "boolean";
    ldir  = "info/unscoped/b/boolean";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
