{

  inputs.packument.url   = "https://registry.npmjs.org/is-utf8?rev=10-b404d234153ea098ce349a0369b02489";
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
    ident = "is-utf8";
    ldir  = "info/unscoped/i/is-utf8";
    inherit packument fetchInfo;
  } // latest';

}
