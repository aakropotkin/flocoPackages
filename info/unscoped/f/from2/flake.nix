{

  inputs.packument.url   = "https://registry.npmjs.org/from2?rev=34-4890e77a525a2988a072456e056070d5";
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
    ident = "from2";
    ldir  = "info/unscoped/f/from2";
    inherit packument fetchInfo;
  } // latest';

}
