{

  inputs.packument.url   = "https://registry.npmjs.org/hammerjs?rev=121-7be5f5e305c4f608d5339d4f01c068a7";
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
    ident = "hammerjs";
    ldir  = "info/unscoped/h/hammerjs";
    inherit packument fetchInfo;
  } // latest';

}
