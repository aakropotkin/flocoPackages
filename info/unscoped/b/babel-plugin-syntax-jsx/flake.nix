{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-syntax-jsx?rev=68-d20e26cca4396128099a9c55f957c19c";
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
    ident = "babel-plugin-syntax-jsx";
    ldir  = "info/unscoped/b/babel-plugin-syntax-jsx";
    inherit packument fetchInfo;
  } // latest';

}
