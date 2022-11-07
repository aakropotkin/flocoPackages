{

  inputs.packument.url   = "https://registry.npmjs.org/npmlog?rev=116-d0ccaab3959081343440f3d510d53d02";
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
    ident = "npmlog";
    ldir  = "info/unscoped/n/npmlog";
    inherit packument fetchInfo;
  } // latest';

}
