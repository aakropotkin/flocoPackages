{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/node-gyp?rev=15-dbb15470b8cf7b070fd6dc7281a648c4";
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
    scope = "@npmcli";
    ident = "@npmcli/node-gyp";
    ldir  = "info/npmcli/node-gyp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
