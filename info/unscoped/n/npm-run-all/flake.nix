{

  inputs.packument.url   = "https://registry.npmjs.org/npm-run-all?rev=289-b25cdc9ce0a65f2882ecbe4ec2c3077c";
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
    scope = null;
    ident = "npm-run-all";
    ldir  = "info/unscoped/n/npm-run-all";
    inherit packument fetchInfo;
  } // latest';

}
