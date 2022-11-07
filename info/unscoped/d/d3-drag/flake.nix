{

  inputs.packument.url   = "https://registry.npmjs.org/d3-drag?rev=32-56d2ebdecb3c7aaebe3b3683d1b1e559";
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
    ident = "d3-drag";
    ldir  = "info/unscoped/d/d3-drag";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
