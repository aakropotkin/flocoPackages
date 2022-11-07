{

  inputs.packument.url   = "https://registry.npmjs.org/is-typedarray?rev=6-ae85c85ced40df89a3f1b0d97b2940bf";
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
    ident = "is-typedarray";
    ldir  = "info/unscoped/i/is-typedarray";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
