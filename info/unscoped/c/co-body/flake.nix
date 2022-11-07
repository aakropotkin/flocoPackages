{

  inputs.packument.url   = "https://registry.npmjs.org/co-body?rev=53-c5dfc3d1f9600aba984c0e5ef38ccbc3";
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
    ident = "co-body";
    ldir  = "info/unscoped/c/co-body";
    inherit packument fetchInfo;
  } // latest';

}
