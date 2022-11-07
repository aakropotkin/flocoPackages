{

  inputs.packument.url   = "https://registry.npmjs.org/d3-shape?rev=47-1ad4fbccfdb885b45067c34e7c4efac5";
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
    ident = "d3-shape";
    ldir  = "info/unscoped/d/d3-shape";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
