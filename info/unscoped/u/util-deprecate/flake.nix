{

  inputs.packument.url   = "https://registry.npmjs.org/util-deprecate?rev=10-316416ab420c938cec971364c2735d25";
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
    ident = "util-deprecate";
    ldir  = "info/unscoped/u/util-deprecate";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
