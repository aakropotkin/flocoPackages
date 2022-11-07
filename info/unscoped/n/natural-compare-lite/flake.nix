{

  inputs.packument.url   = "https://registry.npmjs.org/natural-compare-lite?rev=70-df16c3e1b804699baaeb3d3ba57792df";
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
    ident = "natural-compare-lite";
    ldir  = "info/unscoped/n/natural-compare-lite";
    inherit packument fetchInfo;
  } // latest';

}
