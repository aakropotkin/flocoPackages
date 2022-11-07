{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/git?rev=35-1dff647dbaf3766fd4fb542230de16be";
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
    ident = "@npmcli/git";
    ldir  = "info/npmcli/git";
    inherit packument fetchInfo;
  } // latest';

}
