{

  inputs.packument.url   = "https://registry.npmjs.org/chance?rev=191-fd6ba54af4a736435ac7ed4ea79a3287";
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
    ident = "chance";
    ldir  = "info/unscoped/c/chance";
    inherit packument fetchInfo;
  } // latest';

}
