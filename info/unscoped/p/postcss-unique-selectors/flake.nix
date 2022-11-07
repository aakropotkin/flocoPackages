{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-unique-selectors?rev=46-9e1b7f910845f3b361872dc09ebe2310";
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
    ident = "postcss-unique-selectors";
    ldir  = "info/unscoped/p/postcss-unique-selectors";
    inherit packument fetchInfo;
  } // latest';

}
