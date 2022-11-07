{

  inputs.packument.url   = "https://registry.npmjs.org/dot-prop?rev=52-d6e116ca12ebf0dd6ad6b15aaa250202";
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
    ident = "dot-prop";
    ldir  = "info/unscoped/d/dot-prop";
    inherit packument fetchInfo;
  } // latest';

}
