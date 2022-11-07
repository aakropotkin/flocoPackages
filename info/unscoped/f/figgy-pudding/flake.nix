{

  inputs.packument.url   = "https://registry.npmjs.org/figgy-pudding?rev=46-56d247cb1de1f23779ae389b55a45e41";
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
    ident = "figgy-pudding";
    ldir  = "info/unscoped/f/figgy-pudding";
    inherit packument fetchInfo;
  } // latest';

}
