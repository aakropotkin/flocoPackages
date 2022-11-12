{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@rollup/pluginutils?_rev=20-a9878ea838e6743236c50a986af4e56e";
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
    ident = "@rollup/pluginutils";
    ldir  = "info/rollup/pluginutils";
    inherit packument fetchInfo;
  } // latest';

}
