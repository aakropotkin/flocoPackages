{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@npmcli%2fname-from-folder?_rev=15-47521d3b9eefd1c5f3a5d7f3e943684e";
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
    ident = "@npmcli/name-from-folder";
    ldir  = "info/npmcli/name-from-folder";
    inherit packument fetchInfo;
  } // latest';

}
