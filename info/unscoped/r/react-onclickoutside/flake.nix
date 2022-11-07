{

  inputs.packument.url   = "https://registry.npmjs.org/react-onclickoutside?rev=103-27cf1bb9493601389e9e8ae23d0e7fd6";
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
    ident = "react-onclickoutside";
    ldir  = "info/unscoped/r/react-onclickoutside";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
