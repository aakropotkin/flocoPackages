{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/args?_rev=104-5463b938d11871f342a7ceeb48673fe4";
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
    ident = "args";
    ldir  = "info/unscoped/a/args";
    inherit packument fetchInfo;
  } // latest';

}
