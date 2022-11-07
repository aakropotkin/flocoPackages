{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/g2plot?rev=244-1260f7e445acc6b58cb9c830e54638a7";
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
    scope = "@antv";
    ident = "@antv/g2plot";
    ldir  = "info/antv/g2plot";
    inherit packument fetchInfo;
  } // latest';

}
