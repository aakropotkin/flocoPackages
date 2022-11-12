{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@protobufjs%2finquire?_rev=7-30df8e92ab24d029b47d8911295dfefe";
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
    ident = "@protobufjs/inquire";
    ldir  = "info/protobufjs/inquire";
    inherit packument fetchInfo;
  } // latest';

}
