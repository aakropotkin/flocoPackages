{

  inputs.packument.url   = "https://registry.npmjs.org/isbinaryfile?rev=60-36f925838f079976f921ee1d2d313b77";
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
    ident = "isbinaryfile";
    ldir  = "info/unscoped/i/isbinaryfile";
    inherit packument fetchInfo;
  } // latest';

}
