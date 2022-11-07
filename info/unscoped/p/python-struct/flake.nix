{

  inputs.packument.url   = "https://registry.npmjs.org/python-struct?rev=21-cff7b15c5609735e8475449ac3ad3cc5";
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
    ident = "python-struct";
    ldir  = "info/unscoped/p/python-struct";
    inherit packument fetchInfo;
  } // latest';

}
