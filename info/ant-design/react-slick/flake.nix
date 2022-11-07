{

  inputs.packument.url   = "https://registry.npmjs.org/@ant-design/react-slick?rev=39-974bc23a0dfa7637d581f99c214ef630";
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
    ident = "@ant-design/react-slick";
    ldir  = "info/ant-design/react-slick";
    inherit packument fetchInfo;
  } // latest';

}
