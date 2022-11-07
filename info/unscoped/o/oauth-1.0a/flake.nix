{

  inputs.packument.url   = "https://registry.npmjs.org/oauth-1.0a?rev=38-a3f20c8f77a8ada0cb89a1e9095f677b";
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
    ident = "oauth-1.0a";
    ldir  = "info/unscoped/o/oauth-1.0a";
    inherit packument fetchInfo;
  } // latest';

}
