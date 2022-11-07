{

  inputs.packument.url   = "https://registry.npmjs.org/d3-dsv?rev=47-7a1200db399114445f009b3152f95554";
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
    ident = "d3-dsv";
    ldir  = "info/unscoped/d/d3-dsv";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
