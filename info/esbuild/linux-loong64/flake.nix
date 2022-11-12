{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@esbuild/linux-loong64?_rev=18-403038ca476bce1f149e038c92ab6dd8";
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
    scope = "@esbuild";
    ident = "@esbuild/linux-loong64";
    ldir  = "info/esbuild/linux-loong64";
    inherit packument fetchInfo;
  } // latest';

}
