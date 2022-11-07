{

  inputs.packument.url   = "https://registry.npmjs.org/ssf?rev=114-0fd4c6496fe298bc1a2229b82b7755f9";
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
    ident = "ssf";
    ldir  = "info/unscoped/s/ssf";
    inherit packument fetchInfo;
  } // latest';

}
