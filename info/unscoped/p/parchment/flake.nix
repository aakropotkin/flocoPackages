{

  inputs.packument.url   = "https://registry.npmjs.org/parchment?rev=50-4be8dd7490fcf3eefef580cf2776af63";
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
    ident = "parchment";
    ldir  = "info/unscoped/p/parchment";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
