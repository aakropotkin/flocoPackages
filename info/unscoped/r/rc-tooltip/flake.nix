{

  inputs.packument.url   = "https://registry.npmjs.org/rc-tooltip?rev=104-d50ced66fd72fcc4ee089467076b6f6d";
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
    ident = "rc-tooltip";
    ldir  = "info/unscoped/r/rc-tooltip";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
