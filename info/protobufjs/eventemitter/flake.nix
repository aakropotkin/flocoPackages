{

  inputs.packument.url   = "https://registry.npmjs.org/@protobufjs/eventemitter?rev=10-248812826f47a15576f267feee168a29";
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
    ident = "@protobufjs/eventemitter";
    ldir  = "info/protobufjs/eventemitter";
    inherit packument fetchInfo;
  } // latest';

}
