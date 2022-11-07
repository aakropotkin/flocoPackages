{

  inputs.packument.url   = "https://registry.npmjs.org/contour_plot?rev=3-38cf01b3dc54dc65ecddcff7fa80bef7";
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
    ident = "contour_plot";
    ldir  = "info/unscoped/c/contour_plot";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
