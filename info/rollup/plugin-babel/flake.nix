{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@rollup/plugin-babel?_rev=14-7cceb71521bc1fd45ee11e115fa8e19a";
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
    scope = "@rollup";
    ident = "@rollup/plugin-babel";
    ldir  = "info/rollup/plugin-babel";
    inherit packument fetchInfo;
  } // latest';

}
