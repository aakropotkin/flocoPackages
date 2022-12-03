{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-split-export-declaration";
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
    scope = "@babel";
    ident = "@babel/helper-split-export-declaration";
    ldir  = "info/babel/helper-split-export-declaration";
    inherit packument fetchInfo;
  } // latest';

}
