{

  inputs.packument.url   = "https://registry.npmjs.org/@protobufjs/aspromise?rev=12-64af4e34e2676721daaa93c229aee15b";
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
    ident = "@protobufjs/aspromise";
    ldir  = "info/protobufjs/aspromise";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
