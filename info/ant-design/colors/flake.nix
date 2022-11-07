{

  inputs.packument.url   = "https://registry.npmjs.org/@ant-design/colors?rev=54-7274e4955e5d407e28f6d2f0bb22b9c7";
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
    scope = "@ant-design";
    ident = "@ant-design/colors";
    ldir  = "info/ant-design/colors";
    inherit packument fetchInfo;
  } // latest';

}
