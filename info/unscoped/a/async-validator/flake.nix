{

  inputs.packument.url   = "https://registry.npmjs.org/async-validator?rev=112-63e562504a466bddf7da7975a639c6e7";
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
    ident = "async-validator";
    ldir  = "info/unscoped/a/async-validator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
