{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ant-design/icons?_rev=164-7cf33beafd36ab1f48b46a7da1859a78";
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
    ident = "@ant-design/icons";
    ldir  = "info/ant-design/icons";
    inherit packument fetchInfo;
  } // latest';

}
