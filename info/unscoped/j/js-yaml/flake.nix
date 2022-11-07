{

  inputs.packument.url   = "https://registry.npmjs.org/js-yaml?rev=265-f39334ea91518aab979dc281616b6c13";
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
    ident = "js-yaml";
    ldir  = "info/unscoped/j/js-yaml";
    inherit packument fetchInfo;
  } // latest';

}
