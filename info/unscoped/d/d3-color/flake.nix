{

  inputs.packument.url   = "https://registry.npmjs.org/d3-color?rev=56-6eccdf2b903cf9fd3a81e9c48482a5e6";
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
    ident = "d3-color";
    ldir  = "info/unscoped/d/d3-color";
    inherit packument fetchInfo;
  } // latest';

}
