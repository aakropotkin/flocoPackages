{

  inputs.packument.url   = "https://registry.npmjs.org/split.js?rev=53-f6b2e6774b4b08d19892afebd6897584";
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
    ident = "split.js";
    ldir  = "info/unscoped/s/split.js";
    inherit packument fetchInfo;
  } // latest';

}
