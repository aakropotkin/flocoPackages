{

  inputs.packument.url   = "https://registry.npmjs.org/grouped-queue?rev=32-2d6dbaacd78906dde34c3fbd340f16bd";
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
    ident = "grouped-queue";
    ldir  = "info/unscoped/g/grouped-queue";
    inherit packument fetchInfo;
  } // latest';

}
