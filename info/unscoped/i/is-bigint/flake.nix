{

  inputs.packument.url   = "https://registry.npmjs.org/is-bigint?rev=7-37fa60a216a543e9364aacf38305f18e";
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
    ident = "is-bigint";
    ldir  = "info/unscoped/i/is-bigint";
    inherit packument fetchInfo;
  } // latest';

}
