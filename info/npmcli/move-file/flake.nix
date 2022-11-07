{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/move-file?rev=22-af0e5b74c139683ba2e0a3a83e5907f7";
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
    ident = "@npmcli/move-file";
    ldir  = "info/npmcli/move-file";
    inherit packument fetchInfo;
  } // latest';

}
