{

  inputs.packument.url   = "https://registry.npmjs.org/base-x?rev=43-94676940a04bc2b8484128f96d7b5807";
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
    ident = "base-x";
    ldir  = "info/unscoped/b/base-x";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
