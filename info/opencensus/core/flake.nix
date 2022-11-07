{

  inputs.packument.url   = "https://registry.npmjs.org/@opencensus/core?rev=26-e7245b110e132a7bbb1353b501b62cde";
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
    scope = "@opencensus";
    ident = "@opencensus/core";
    ldir  = "info/opencensus/core";
    inherit packument fetchInfo;
  } // latest';

}
