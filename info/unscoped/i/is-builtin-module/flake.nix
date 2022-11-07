{

  inputs.packument.url   = "https://registry.npmjs.org/is-builtin-module?rev=10-5ab85343a9c67ec74920f6c6b9d1192e";
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
    ident = "is-builtin-module";
    ldir  = "info/unscoped/i/is-builtin-module";
    inherit packument fetchInfo;
  } // latest';

}
