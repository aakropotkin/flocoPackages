{

  inputs.packument.url   = "https://registry.npmjs.org/markdown-it-anchor?rev=70-a96af305cce60a8cd719d3dcae512da3";
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
    ident = "markdown-it-anchor";
    ldir  = "info/unscoped/m/markdown-it-anchor";
    inherit packument fetchInfo;
  } // latest';

}
