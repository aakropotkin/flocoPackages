{

  inputs.packument.url   = "https://registry.npmjs.org/streamroller?rev=62-7056aa7b1f2b30b562b41484b405afe0";
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
    ident = "streamroller";
    ldir  = "info/unscoped/s/streamroller";
    inherit packument fetchInfo;
  } // latest';

}
