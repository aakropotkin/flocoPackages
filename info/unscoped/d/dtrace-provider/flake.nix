{

  inputs.packument.url   = "https://registry.npmjs.org/dtrace-provider?rev=88-526f62cc3fe7f36366ac98eea5f7f5a8";
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
    ident = "dtrace-provider";
    ldir  = "info/unscoped/d/dtrace-provider";
    inherit packument fetchInfo;
  } // latest';

}
