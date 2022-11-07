{

  inputs.packument.url   = "https://registry.npmjs.org/abstract-leveldown?rev=146-906fe3d8481c88cfbe95d605d294d6f0";
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
    ident = "abstract-leveldown";
    ldir  = "info/unscoped/a/abstract-leveldown";
    inherit packument fetchInfo;
  } // latest';

}
