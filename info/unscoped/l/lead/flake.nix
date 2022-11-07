{

  inputs.packument.url   = "https://registry.npmjs.org/lead?rev=14-e8d6019d2f4d72188b48e93385a006f6";
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
    ident = "lead";
    ldir  = "info/unscoped/l/lead";
    inherit packument fetchInfo;
  } // latest';

}
