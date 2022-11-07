{

  inputs.packument.url   = "https://registry.npmjs.org/pako?rev=77-1ae3780e78eae91cb79d210bafb382ea";
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
    ident = "pako";
    ldir  = "info/unscoped/p/pako";
    inherit packument fetchInfo;
  } // latest';

}
