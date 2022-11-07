{

  inputs.packument.url   = "https://registry.npmjs.org/object-keys?rev=104-fff9f09b12add81f4389e3e50a2ff098";
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
    ident = "object-keys";
    ldir  = "info/unscoped/o/object-keys";
    inherit packument fetchInfo;
  } // latest';

}
