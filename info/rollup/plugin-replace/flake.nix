{

  inputs.packument.url   = "https://registry.npmjs.org/@rollup/plugin-replace?rev=17-de335a7e1d1ece1cef60cd2174233e63";
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
    ident = "@rollup/plugin-replace";
    ldir  = "info/rollup/plugin-replace";
    inherit packument fetchInfo;
  } // latest';

}
