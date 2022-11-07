{

  inputs.packument.url   = "https://registry.npmjs.org/fastq?rev=26-27c574d30d8e297eb09b91f5762e19b6";
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
    ident = "fastq";
    ldir  = "info/unscoped/f/fastq";
    inherit packument fetchInfo;
  } // latest';

}
