{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-react-pure-annotations?rev=13-71e5bcc4c7f0655cff372ff9726d2db0";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-react-pure-annotations";
    ldir  = "info/babel/plugin-transform-react-pure-annotations";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
