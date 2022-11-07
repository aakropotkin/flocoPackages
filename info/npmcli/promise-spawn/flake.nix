{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/promise-spawn?rev=28-b5bc38f9ea5aa5a9b96fb43565cfdddd";
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
    ident = "@npmcli/promise-spawn";
    ldir  = "info/npmcli/promise-spawn";
    inherit packument fetchInfo;
  } // latest';

}
