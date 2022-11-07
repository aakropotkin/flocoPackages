{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/g-plugin-svg-picker?rev=152-29b4e18a6049c52f7eea020d68152f1b";
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
    scope = "@antv";
    ident = "@antv/g-plugin-svg-picker";
    ldir  = "info/antv/g-plugin-svg-picker";
    inherit packument fetchInfo;
  } // latest';

}
