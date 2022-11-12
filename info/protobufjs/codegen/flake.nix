{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@protobufjs/codegen?_rev=18-1de3d45a54c351b2de7525d3f2e23bed";
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
    scope = "@protobufjs";
    ident = "@protobufjs/codegen";
    ldir  = "info/protobufjs/codegen";
    inherit packument fetchInfo;
  } // latest';

}
