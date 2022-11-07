{

  inputs.packument.url   = "https://registry.npmjs.org/@protobufjs/utf8?rev=12-4fb59d948fedb3ab9d801d39c6929e03";
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
    ident = "@protobufjs/utf8";
    ldir  = "info/protobufjs/utf8";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
