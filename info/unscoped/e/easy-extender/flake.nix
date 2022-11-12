{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/easy-extender?_rev=21-653d3b134931719ec2d2d29241083d08";
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
    ident = "easy-extender";
    ldir  = "info/unscoped/e/easy-extender";
    inherit packument fetchInfo;
  } // latest';

}
