{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-syntax-async-functions?rev=68-f9f02e783f69fd39b79cebe0ca6123f9";
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
    ident = "babel-plugin-syntax-async-functions";
    ldir  = "info/unscoped/b/babel-plugin-syntax-async-functions";
    inherit packument fetchInfo;
  } // latest';

}
