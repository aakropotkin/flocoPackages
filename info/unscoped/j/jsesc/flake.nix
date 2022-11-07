{

  inputs.packument.url   = "https://registry.npmjs.org/jsesc?rev=47-da6870d54b13313d8f05e513fc184422";
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
    ident = "jsesc";
    ldir  = "info/unscoped/j/jsesc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
