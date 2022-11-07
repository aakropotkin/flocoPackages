{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-regex?rev=87-cf8cd6b329d5ce2fe8b676489c622e08";
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
    ident = "babel-helper-regex";
    ldir  = "info/unscoped/b/babel-helper-regex";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
