{

  inputs.packument.url   = "https://registry.npmjs.org/stat-mode?rev=15-3c4ba791e64ff295f8d4b4977fa8fb47";
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
    ident = "stat-mode";
    ldir  = "info/unscoped/s/stat-mode";
    inherit packument fetchInfo;
  } // latest';

}
