{

  inputs.packument.url   = "https://registry.npmjs.org/recharts-scale?rev=29-04ad5ae57339c0182c4ad627db80cb8b";
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
    ident = "recharts-scale";
    ldir  = "info/unscoped/r/recharts-scale";
    inherit packument fetchInfo;
  } // latest';

}
