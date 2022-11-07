{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-react-app?rev=148-d5ac96cd32e4eb9b0910da339fd00ea3";
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
    ident = "babel-preset-react-app";
    ldir  = "info/unscoped/b/babel-preset-react-app";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
