{

  inputs.packument.url   = "https://registry.npmjs.org/invariant?rev=52-ff4df3cf968a858426577ff133264c2f";
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
    ident = "invariant";
    ldir  = "info/unscoped/i/invariant";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
