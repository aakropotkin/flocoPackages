{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/fs?rev=13-06c5f1fe89c5b2c8c7cf916b9406c6d8";
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
    ident = "@npmcli/fs";
    ldir  = "info/npmcli/fs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
